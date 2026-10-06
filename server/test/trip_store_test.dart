import 'package:driver_shifts_server/driver_shifts_server.dart';
import 'package:test/test.dart';

import 'helpers.dart';

void main() {
  late TripStore store;

  setUp(() => store = TripStore());

  group('защита от дублей', () {
    test('повтор той же поездки не создаёт дубль', () {
      expect(store.add(trip()), isA<TripCreated>());
      expect(store.add(trip()), isA<TripAlreadyExists>());
      expect(store.add(trip()), isA<TripAlreadyExists>());

      expect(store.length, 1);
      expect(store.tripsOn('2026-10-01'), hasLength(1));
    });

    test('повтор с тем же моментом в другой записи — тоже повтор', () {
      store.add(trip());

      final sameInstantOtherOffset = trip(
        start: '2026-10-01T08:10:00.000+05:00',
      );

      expect(store.add(sameInstantOtherOffset), isA<TripAlreadyExists>());
      expect(store.length, 1);
    });

    test('тот же id с другими данными — конфликт, исходник не меняется', () {
      store.add(trip(amount: 2400));

      final result = store.add(trip(amount: 9999));

      expect(result, isA<TripIdConflict>());
      expect(store.length, 1);
      expect(store.tripsOn('2026-10-01').single.amount, 2400);
    });

    test('та же поездка под новым id — пересечение, дубль не создаётся', () {
      store.add(trip(id: 't1'));

      final result = store.add(trip(id: 't1-retry'));

      expect(result, isA<TripOverlap>());
      expect(result.trip.id, 't1');
      expect(store.length, 1);
    });

    test('частичное пересечение по времени тоже отклоняется', () {
      store.add(
        trip(
          id: 'a',
          start: '2026-10-01T08:00:00+05:00',
          end: '2026-10-01T08:30:00+05:00',
        ),
      );

      final result = store.add(
        trip(
          id: 'b',
          start: '2026-10-01T08:29:00+05:00',
          end: '2026-10-01T08:50:00+05:00',
        ),
      );

      expect(result, isA<TripOverlap>());
    });

    test('пересечение через смещения: 08:10+05:00 = 03:10Z', () {
      store.add(trip(id: 'a'));

      final result = store.add(
        trip(
          id: 'b',
          start: '2026-10-01T03:15:00Z',
          end: '2026-10-01T03:20:00Z',
        ),
      );

      expect(result, isA<TripOverlap>());
    });

    test('поездка встык к предыдущей — не пересечение', () {
      store.add(
        trip(
          id: 'a',
          start: '2026-10-01T08:00:00+05:00',
          end: '2026-10-01T08:30:00+05:00',
        ),
      );

      final result = store.add(
        trip(
          id: 'b',
          start: '2026-10-01T08:30:00+05:00',
          end: '2026-10-01T08:50:00+05:00',
        ),
      );

      expect(result, isA<TripCreated>());
      expect(store.length, 2);
    });
  });

  group('дни', () {
    test(
      'поездки дня отсортированы по началу независимо от порядка вставки',
      () {
        store.add(
          trip(
            id: 'late',
            start: '2026-10-01T18:00:00+05:00',
            end: '2026-10-01T18:20:00+05:00',
          ),
        );
        store.add(
          trip(
            id: 'early',
            start: '2026-10-01T07:00:00+05:00',
            end: '2026-10-01T07:20:00+05:00',
          ),
        );
        store.add(
          trip(
            id: 'mid',
            start: '2026-10-01T12:00:00+05:00',
            end: '2026-10-01T12:20:00+05:00',
          ),
        );

        expect(store.tripsOn('2026-10-01').map((t) => t.id), [
          'early',
          'mid',
          'late',
        ]);
      },
    );

    test('день считается по часам водителя, а не по UTC', () {
      // 02:00 по +05:00 — это 21:00 UTC предыдущего дня.
      store.add(
        trip(
          start: '2026-10-01T02:00:00+05:00',
          end: '2026-10-01T02:20:00+05:00',
        ),
      );

      expect(store.tripsOn('2026-10-01'), hasLength(1));
      expect(store.tripsOn('2026-09-30'), isEmpty);
    });

    test('ночная поездка относится к дню начала', () {
      store.add(
        trip(
          start: '2026-10-03T23:48:00+05:00',
          end: '2026-10-04T00:21:00+05:00',
        ),
      );

      expect(store.tripsOn('2026-10-03'), hasLength(1));
      expect(store.tripsOn('2026-10-04'), isEmpty);
    });

    test('days() — только дни с поездками, по возрастанию', () {
      store.add(
        trip(
          id: 'b',
          start: '2026-10-05T08:00:00+05:00',
          end: '2026-10-05T08:20:00+05:00',
        ),
      );
      store.add(
        trip(
          id: 'a',
          start: '2026-10-01T08:00:00+05:00',
          end: '2026-10-01T08:20:00+05:00',
        ),
      );

      expect(store.days(), ['2026-10-01', '2026-10-05']);
    });
  });
}
