import 'package:driver_shifts_server/driver_shifts_server.dart';
import 'package:test/test.dart';

import 'helpers.dart';

void main() {
  group('DaySummary.fromTrips', () {
    test('пустой день — все нули', () {
      final summary = DaySummary.fromTrips([]);

      expect(summary.tripsCount, 0);
      expect(summary.revenue, 0);
      expect(summary.commission, 0);
      expect(summary.net, 0);
      expect(summary.cash.count, 0);
      expect(summary.card.count, 0);
    });

    test('пример из задания: t1 картой + t2 наличными', () {
      final summary = DaySummary.fromTrips([
        trip(id: 't1', amount: 2400, commission: 360),
        trip(
          id: 't2',
          start: '2026-10-01T09:05:00+05:00',
          end: '2026-10-01T09:20:00+05:00',
          amount: 1500,
          payment: PaymentMethod.cash,
          commission: 225,
        ),
      ]);

      expect(summary.tripsCount, 2);
      expect(summary.revenue, 3900);
      expect(summary.commission, 585);
      expect(summary.net, 3315);
      expect(summary.card.count, 1);
      expect(summary.card.revenue, 2400);
      expect(summary.cash.count, 1);
      expect(summary.cash.revenue, 1500);
    });

    test('разбивка по оплате в сумме даёт общую выручку', () {
      final trips = [
        for (var i = 0; i < 5; i++)
          trip(
            id: 't$i',
            start: '2026-10-01T1$i:00:00+05:00',
            end: '2026-10-01T1$i:30:00+05:00',
            amount: 100 * (i + 1),
            payment: i.isEven ? PaymentMethod.cash : PaymentMethod.card,
            commission: 10 * (i + 1),
          ),
      ];

      final summary = DaySummary.fromTrips(trips);

      expect(summary.cash.count + summary.card.count, summary.tripsCount);
      expect(summary.cash.revenue + summary.card.revenue, summary.revenue);
      expect(summary.cash.revenue, 100 + 300 + 500);
      expect(summary.card.revenue, 200 + 400);
      expect(summary.net, 1500 - 150);
    });

    test('только наличные — по карте нули', () {
      final summary = DaySummary.fromTrips([
        trip(payment: PaymentMethod.cash, amount: 700, commission: 0),
      ]);

      expect(summary.card.count, 0);
      expect(summary.card.revenue, 0);
      expect(summary.cash.revenue, 700);
      expect(summary.net, 700);
    });
  });
}
