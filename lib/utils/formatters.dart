import 'package:intl/intl.dart';

import '../domain/model/payment_method.dart';
import '../domain/model/trip_time.dart';

final _money = NumberFormat.decimalPattern('ru');
final _dayTitle = DateFormat('d MMMM, EEEE', 'ru');

/// `2400` → `2 400 ₽`.
String formatMoney(int rubles) => '${_money.format(rubles)} ₽';

/// Время по часам водителя: `08:10`.
String formatClock(TripTime time) {
  final w = time.wallClock;
  return '${w.hour.toString().padLeft(2, '0')}:${w.minute.toString().padLeft(2, '0')}';
}

/// `1 октября, четверг`.
String formatDayTitle(DateTime date) => _dayTitle.format(date);

/// `22 мин`, `1 ч 05 мин`.
String formatDuration(Duration duration) {
  final hours = duration.inHours;
  final minutes = duration.inMinutes % 60;
  if (hours == 0) return '$minutes мин';
  return '$hours ч ${minutes.toString().padLeft(2, '0')} мин';
}

/// `9 поездок`, `1 поездка`, `3 поездки`.
String formatTripsCount(int count) {
  final mod10 = count % 10;
  final mod100 = count % 100;
  final word = mod10 == 1 && mod100 != 11
      ? 'поездка'
      : mod10 >= 2 && mod10 <= 4 && (mod100 < 12 || mod100 > 14)
      ? 'поездки'
      : 'поездок';
  return '$count $word';
}

String paymentTitle(PaymentMethod payment) => switch (payment) {
  PaymentMethod.cash => 'Наличные',
  PaymentMethod.card => 'Карта',
};
