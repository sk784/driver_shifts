import 'package:freezed_annotation/freezed_annotation.dart';

import 'payment_method.dart';
import 'trip_time.dart';

part 'trip.freezed.dart';

/// Поездка. Суммы — целые рубли.
@freezed
abstract class Trip with _$Trip {
  const Trip._();

  const factory Trip({
    required String id,
    required TripTime start,
    required TripTime end,
    required int amount,
    required PaymentMethod payment,
    required int commission,
  }) = _Trip;

  Duration get duration => end.instant.difference(start.instant);

  /// Поездка закончилась уже на следующий календарный день (ночная).
  bool get isEndsNextDay => end.localDate.isAfter(start.localDate);
}
