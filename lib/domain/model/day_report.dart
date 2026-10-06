import 'package:freezed_annotation/freezed_annotation.dart';

import 'day_summary.dart';
import 'trip.dart';

part 'day_report.freezed.dart';

@freezed
abstract class DayReport with _$DayReport {
  const factory DayReport({
    required DateTime date,
    required DaySummary summary,
    required List<Trip> trips,
  }) = _DayReport;
}
