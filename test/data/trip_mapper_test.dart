import 'package:driver_shifts/data/dto/trip_dto.dart';
import 'package:driver_shifts/data/mapper/trip_mapper.dart';
import 'package:driver_shifts/domain/model/payment_method.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final mapper = TripMapper();

  const dto = TripDto(
    id: 't1',
    start: '2026-10-01T08:10:00+05:00',
    end: '2026-10-01T08:32:00+05:00',
    amount: 2400,
    payment: 'card',
    commission: 360,
  );

  test('время показывается по часам водителя, а не в UTC', () {
    final trip = mapper.fromDto(dto);

    expect(trip.start.wallClock.hour, 8);
    expect(trip.start.wallClock.minute, 10);
    expect(trip.start.instant, DateTime.utc(2026, 10, 1, 3, 10));
    expect(trip.start.offset, const Duration(hours: 5));
    expect(trip.payment, PaymentMethod.card);
    expect(trip.duration, const Duration(minutes: 22));
  });

  test('ранняя поездка не уезжает в предыдущий день', () {
    final time = mapper.parseTime('2026-10-01T02:00:00+05:00');

    expect(time.localDate, DateTime(2026, 10, 1));
  });

  test('отрицательное смещение и Z', () {
    expect(
      mapper.parseTime('2026-10-01T08:10:00-03:30').instant,
      DateTime.utc(2026, 10, 1, 11, 40),
    );
    expect(mapper.parseTime('2026-10-01T08:10:00Z').offset, Duration.zero);
  });

  test('туда-обратно без потерь', () {
    expect(mapper.toDto(mapper.fromDto(dto)).toJson(), dto.toJson());
    expect(
      mapper.formatTime(mapper.parseTime('2026-10-01T08:10:00-03:30')),
      '2026-10-01T08:10:00-03:30',
    );
  });

  test('ночная поездка заканчивается на следующий день', () {
    final trip = mapper.fromDto(
      const TripDto(
        id: 'n',
        start: '2026-10-03T23:48:00+05:00',
        end: '2026-10-04T00:21:00+05:00',
        amount: 1900,
        payment: 'cash',
        commission: 285,
      ),
    );

    expect(trip.isEndsNextDay, isTrue);
    expect(trip.start.localDate, DateTime(2026, 10, 3));
  });

  test('время без смещения — ошибка формата', () {
    expect(
      () => mapper.parseTime('2026-10-01T08:10:00'),
      throwsFormatException,
    );
  });

  test('дата для API', () {
    expect(mapper.formatDate(DateTime(2026, 1, 5)), '2026-01-05');
  });
}
