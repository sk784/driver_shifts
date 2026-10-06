import 'package:injectable/injectable.dart';

import '../../domain/model/day_report.dart';
import '../../domain/model/day_summary.dart';
import '../../domain/model/payment_method.dart';
import '../../domain/model/payment_total.dart';
import '../../domain/model/trip.dart';
import '../../domain/model/trip_time.dart';
import '../dto/day_report_dto.dart';
import '../dto/day_summary_dto.dart';
import '../dto/trip_dto.dart';

/// Маппинг DTO ↔ доменная модель.
///
/// Главная тонкость — время. `DateTime.parse` переводит строку со смещением
/// в UTC и смещение выбрасывает, поэтому его достаём из строки отдельно.
@injectable
class TripMapper {
  static final _offsetPattern = RegExp(r'(Z|[+-]\d{2}:\d{2})$');

  Trip fromDto(TripDto dto) => Trip(
    id: dto.id,
    start: parseTime(dto.start),
    end: parseTime(dto.end),
    amount: dto.amount,
    payment: PaymentMethod.values.byName(dto.payment),
    commission: dto.commission,
  );

  TripDto toDto(Trip trip) => TripDto(
    id: trip.id,
    start: formatTime(trip.start),
    end: formatTime(trip.end),
    amount: trip.amount,
    payment: trip.payment.name,
    commission: trip.commission,
  );

  DayReport reportFromDto(DayReportDto dto) => DayReport(
    date: parseDate(dto.date),
    summary: _summaryFromDto(dto.summary),
    trips: dto.trips.map(fromDto).toList(growable: false),
  );

  TripTime parseTime(String value) {
    final zone = _offsetPattern.firstMatch(value)?.group(1);
    if (zone == null) {
      throw FormatException('Время без смещения: $value');
    }
    var offset = Duration.zero;
    if (zone != 'Z') {
      final sign = zone.startsWith('-') ? -1 : 1;
      offset =
          Duration(
            hours: int.parse(zone.substring(1, 3)),
            minutes: int.parse(zone.substring(4, 6)),
          ) *
          sign;
    }
    return TripTime(instant: DateTime.parse(value).toUtc(), offset: offset);
  }

  /// `2026-10-01T08:10:00+05:00` — время по часам водителя + его смещение.
  String formatTime(TripTime time) {
    final w = time.wallClock;
    final minutes = time.offset.inMinutes.abs();
    final sign = time.offset.isNegative ? '-' : '+';
    return '${formatDate(w)}T${_pad(w.hour)}:${_pad(w.minute)}:${_pad(w.second)}'
        '$sign${_pad(minutes ~/ 60)}:${_pad(minutes % 60)}';
  }

  /// День для API: `yyyy-MM-dd`.
  String formatDate(DateTime date) =>
      '${date.year.toString().padLeft(4, '0')}-${_pad(date.month)}-${_pad(date.day)}';

  DateTime parseDate(String value) {
    final parsed = DateTime.parse(value);
    return DateTime(parsed.year, parsed.month, parsed.day);
  }

  DaySummary _summaryFromDto(DaySummaryDto dto) => DaySummary(
    tripsCount: dto.tripsCount,
    revenue: dto.revenue,
    commission: dto.commission,
    net: dto.net,
    cash: PaymentTotal(count: dto.cash.count, revenue: dto.cash.revenue),
    card: PaymentTotal(count: dto.card.count, revenue: dto.card.revenue),
  );

  static String _pad(int value) => value.toString().padLeft(2, '0');
}
