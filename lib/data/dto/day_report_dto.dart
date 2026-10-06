import 'package:json_annotation/json_annotation.dart';

import 'day_summary_dto.dart';
import 'trip_dto.dart';

part 'day_report_dto.g.dart';

/// Ответ `GET /days/{date}`.
@JsonSerializable()
class DayReportDto {
  const DayReportDto({
    required this.date,
    required this.summary,
    required this.trips,
  });

  /// `yyyy-MM-dd`.
  final String date;
  final DaySummaryDto summary;
  final List<TripDto> trips;

  factory DayReportDto.fromJson(Map<String, dynamic> json) =>
      _$DayReportDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DayReportDtoToJson(this);
}
