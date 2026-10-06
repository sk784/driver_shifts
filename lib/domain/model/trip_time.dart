import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip_time.freezed.dart';

/// Момент времени + смещение, в котором его записал водитель.
///
/// Время поездки показываем по часам водителя, а не по часовому поясу
/// телефона: поездка в Екатеринбурге в 08:10 должна быть 08:10 и на
/// телефоне, выставленном на Москву.
@freezed
abstract class TripTime with _$TripTime {
  const TripTime._();

  const factory TripTime({
    /// Абсолютный момент, UTC.
    required DateTime instant,
    required Duration offset,
  }) = _TripTime;

  /// Время [hour]:[minute] дня [date] в часовом поясе устройства.
  factory TripTime.deviceLocal(DateTime date, int hour, int minute) {
    final local = DateTime(date.year, date.month, date.day, hour, minute);
    final offset = local.timeZoneOffset;
    final wall = DateTime.utc(local.year, local.month, local.day, hour, minute);
    return TripTime(instant: wall.subtract(offset), offset: offset);
  }

  /// Часы на руке водителя. Флаг `isUtc` технический — читаем только поля.
  DateTime get wallClock => instant.toUtc().add(offset);

  /// Календарный день водителя (дата без времени).
  DateTime get localDate {
    final w = wallClock;
    return DateTime(w.year, w.month, w.day);
  }

  bool isAfter(TripTime other) => instant.isAfter(other.instant);
}
