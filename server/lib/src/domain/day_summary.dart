import 'trip.dart';

/// Итоги по одному способу оплаты.
class PaymentBreakdown {
  const PaymentBreakdown({required this.count, required this.revenue});

  static const empty = PaymentBreakdown(count: 0, revenue: 0);

  final int count;
  final int revenue;

  PaymentBreakdown add(Trip trip) =>
      PaymentBreakdown(count: count + 1, revenue: revenue + trip.amount);
}

/// Сводка за день.
///
/// «На руки» = выручка − комиссия, то есть заработок водителя
/// независимо от способа оплаты. Сколько из выручки пришло наличными,
/// а сколько картой — видно в [cash] / [card].
class DaySummary {
  const DaySummary({
    required this.tripsCount,
    required this.revenue,
    required this.commission,
    required this.cash,
    required this.card,
  });

  factory DaySummary.fromTrips(Iterable<Trip> trips) {
    var revenue = 0;
    var commission = 0;
    var count = 0;
    var cash = PaymentBreakdown.empty;
    var card = PaymentBreakdown.empty;
    for (final trip in trips) {
      count++;
      revenue += trip.amount;
      commission += trip.commission;
      switch (trip.payment) {
        case PaymentMethod.cash:
          cash = cash.add(trip);
        case PaymentMethod.card:
          card = card.add(trip);
      }
    }
    return DaySummary(
      tripsCount: count,
      revenue: revenue,
      commission: commission,
      cash: cash,
      card: card,
    );
  }

  final int tripsCount;
  final int revenue;
  final int commission;
  final PaymentBreakdown cash;
  final PaymentBreakdown card;

  int get net => revenue - commission;
}
