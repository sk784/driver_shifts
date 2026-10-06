import 'offset_date_time.dart';

enum PaymentMethod { cash, card }

/// Поездка. Деньги — целые рубли: в примере данных копеек нет,
/// а `double` для денег — источник ошибок округления в сводке.
class Trip {
  const Trip({
    required this.id,
    required this.start,
    required this.end,
    required this.amount,
    required this.payment,
    required this.commission,
  });

  final String id;
  final OffsetDateTime start;
  final OffsetDateTime end;
  final int amount;
  final PaymentMethod payment;
  final int commission;

  /// Поездка относится к дню своего начала (по часам водителя).
  /// Ночная поездка 23:50–00:20 попадает в тот день, когда началась.
  String get date => start.localDate;

  /// Интервалы полуоткрытые: окончание одной поездки в 08:32
  /// и начало следующей в 08:32 — не пересечение.
  bool overlaps(Trip other) =>
      start.isBefore(other.end) && other.start.isBefore(end);

  @override
  bool operator ==(Object other) =>
      other is Trip &&
      other.id == id &&
      other.start == start &&
      other.end == end &&
      other.amount == amount &&
      other.payment == payment &&
      other.commission == commission;

  @override
  int get hashCode => Object.hash(id, start, end, amount, payment, commission);
}
