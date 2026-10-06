import 'package:driver_shifts_server/driver_shifts_server.dart';
import 'package:test/test.dart';

Map<String, Object?> body([Map<String, Object?> patch = const {}]) => {
  'id': 't1',
  'start': '2026-10-01T08:10:00+05:00',
  'end': '2026-10-01T08:32:00+05:00',
  'amount': 2400,
  'payment': 'card',
  'commission': 360,
  ...patch,
};

List<String> errorFields(Object? json) => switch (TripJson.parse(json)) {
  TripInvalid(:final errors) => errors.map((e) => e.field).toList(),
  TripParsed() => [],
};

void main() {
  test('корректная поездка разбирается и сериализуется обратно', () {
    final result = TripJson.parse(body());

    expect(result, isA<TripParsed>());
    expect(TripJson.toJson((result as TripParsed).trip), body());
  });

  test('сумма должна быть > 0', () {
    expect(errorFields(body({'amount': 0})), ['amount']);
    expect(errorFields(body({'amount': -100, 'commission': 0})), ['amount']);
  });

  test('окончание должно быть позже начала', () {
    expect(errorFields(body({'end': '2026-10-01T08:10:00+05:00'})), ['end']);
    expect(errorFields(body({'end': '2026-10-01T08:00:00+05:00'})), ['end']);
  });

  test('окончание сравнивается как момент, а не как строка', () {
    // 04:00Z = 09:00+05:00 — позже начала, хотя «04» < «08».
    expect(errorFields(body({'end': '2026-10-01T04:00:00Z'})), isEmpty);
  });

  test('время без смещения отклоняется: непонятно, к какому дню относить', () {
    expect(errorFields(body({'start': '2026-10-01T08:10:00'})), ['start']);
  });

  test('несуществующая дата отклоняется', () {
    expect(errorFields(body({'start': '2026-13-01T08:10:00+05:00'})), [
      'start',
    ]);
  });

  test('30 февраля не превращается в 2 марта', () {
    expect(errorFields(body({'start': '2026-02-30T08:10:00+05:00'})), [
      'start',
    ]);
  });

  test('61-я секунда не переносится в следующую минуту', () {
    expect(errorFields(body({'start': '2026-10-01T08:10:60+05:00'})), [
      'start',
    ]);
  });

  test('доли секунды отбрасываются — повтор после рестарта совпадёт', () {
    final result = TripJson.parse(
      body({'start': '2026-10-01T08:10:00.750+05:00'}),
    );

    final trip = (result as TripParsed).trip;
    expect(trip.start.toIso8601String(), '2026-10-01T08:10:00+05:00');
    expect(trip, (TripJson.parse(body()) as TripParsed).trip);
  });

  test('суммы — целые рубли', () {
    expect(errorFields(body({'amount': 2400.0})), isEmpty);
    expect(errorFields(body({'amount': 2400.5})), ['amount']);
    expect(errorFields(body({'amount': '2400'})), ['amount']);
  });

  test('комиссия от 0 до суммы', () {
    expect(errorFields(body({'commission': -1})), ['commission']);
    expect(errorFields(body({'commission': 2401})), ['commission']);
    expect(errorFields(body({'commission': 0})), isEmpty);
  });

  test('способ оплаты — только cash или card', () {
    expect(errorFields(body({'payment': 'crypto'})), ['payment']);
    expect(errorFields(body({'payment': null})), ['payment']);
  });

  test('id обязателен', () {
    expect(errorFields(body({'id': ''})), ['id']);
    expect(errorFields(body({'id': null})), ['id']);
  });

  test('все ошибки собираются сразу', () {
    expect(
      errorFields(body({'amount': 0, 'payment': 'x', 'end': 'вчера'})),
      containsAll(['amount', 'payment', 'end']),
    );
  });

  test('не объект — ошибка body', () {
    expect(errorFields([1, 2]), ['body']);
  });
}
