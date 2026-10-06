import 'dart:convert';
import 'dart:io';

import 'package:driver_shifts_server/driver_shifts_server.dart';
import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

void main() {
  late TripStore store;
  late Handler handler;
  late int saves;

  setUp(() {
    store = TripStore();
    saves = 0;
    handler = TripsApi(store, onChanged: (_) => saves++).handler;
  });

  Future<(int, dynamic)> send(
    String method,
    String path, [
    Object? body,
  ]) async {
    final response = await handler(
      Request(
        method,
        Uri.parse('http://localhost$path'),
        body: body == null ? null : (body is String ? body : jsonEncode(body)),
      ),
    );
    return (response.statusCode, jsonDecode(await response.readAsString()));
  }

  const t1 = {
    'id': 't1',
    'start': '2026-10-01T08:10:00+05:00',
    'end': '2026-10-01T08:32:00+05:00',
    'amount': 2400,
    'payment': 'card',
    'commission': 360,
  };

  group('POST /trips', () {
    test('повторная отправка: 201, затем 200 и одна поездка в дне', () async {
      final (first, _) = await send('POST', '/trips', t1);
      final (second, secondBody) = await send('POST', '/trips', t1);

      expect(first, 201);
      expect(second, 200);
      expect(secondBody, t1);
      expect(saves, 1, reason: 'повтор не должен перезаписывать файл');

      final (_, day) = await send('GET', '/days/2026-10-01');
      expect(day['trips'], hasLength(1));
      expect(day['summary']['tripsCount'], 1);
    });

    test('тот же id с другой суммой — 409 id_conflict', () async {
      await send('POST', '/trips', t1);

      final (status, body) = await send('POST', '/trips', {
        ...t1,
        'amount': 3000,
      });

      expect(status, 409);
      expect(body['error'], 'id_conflict');
    });

    test('та же поездка под другим id — 409 overlap', () async {
      await send('POST', '/trips', t1);

      final (status, body) = await send('POST', '/trips', {
        ...t1,
        'id': 't1-copy',
      });

      expect(status, 409);
      expect(body['error'], 'overlap');
      expect(store.length, 1);
    });

    test('невалидные данные — 400 с перечнем полей', () async {
      final (status, body) = await send('POST', '/trips', {
        ...t1,
        'amount': 0,
        'end': '2026-10-01T08:00:00+05:00',
      });

      expect(status, 400);
      expect(body['error'], 'validation');
      expect(
        (body['details'] as List).map((e) => e['field']),
        containsAll(['amount', 'end']),
      );
      expect(store.length, 0);
    });

    test('битый JSON — 400', () async {
      final (status, body) = await send('POST', '/trips', '{oops');

      expect(status, 400);
      expect(body['error'], 'validation');
    });
  });

  group('GET /days', () {
    test('день со сводкой и поездками по порядку', () async {
      await send('POST', '/trips', {
        ...t1,
        'id': 't2',
        'start': '2026-10-01T09:05:00+05:00',
        'end': '2026-10-01T09:20:00+05:00',
        'amount': 1500,
        'payment': 'cash',
        'commission': 225,
      });
      await send('POST', '/trips', t1);

      final (status, body) = await send('GET', '/days/2026-10-01');

      expect(status, 200);
      expect((body['trips'] as List).map((t) => t['id']), ['t1', 't2']);
      expect(body['summary'], {
        'tripsCount': 2,
        'revenue': 3900,
        'commission': 585,
        'net': 3315,
        'cash': {'count': 1, 'revenue': 1500},
        'card': {'count': 1, 'revenue': 2400},
      });
    });

    test('день без поездок — пустой список и нулевая сводка', () async {
      final (status, body) = await send('GET', '/days/2026-10-02');

      expect(status, 200);
      expect(body['trips'], isEmpty);
      expect(body['summary']['tripsCount'], 0);
    });

    test('кривая дата — 400', () async {
      expect((await send('GET', '/days/2026-02-30')).$1, 400);
      expect((await send('GET', '/days/today')).$1, 400);
    });

    test('список дней', () async {
      await send('POST', '/trips', t1);

      final (_, body) = await send('GET', '/days');

      expect(body, {
        'days': ['2026-10-01'],
      });
    });
  });

  test('исходные данные data/trips.json проходят проверку', () {
    final seeded = TripStore();
    TripsFile(File('data/trips.json')).loadInto(seeded);

    expect(seeded.length, greaterThan(2));
    final firstDay = DaySummary.fromTrips(seeded.tripsOn('2026-10-01'));
    expect(firstDay.tripsCount, greaterThanOrEqualTo(2));
  });

  test('сохранение и загрузка файла дают те же поездки', () {
    final dir = Directory.systemTemp.createTempSync('driver_shifts');
    addTearDown(() => dir.deleteSync(recursive: true));
    final source = TripStore();
    TripsFile(File('data/trips.json')).loadInto(source);

    final file = TripsFile(File('${dir.path}/nested/trips.json'))
      ..save(source.all());
    final restored = TripStore();
    file.loadInto(restored);

    expect(restored.all(), source.all());
  });
}
