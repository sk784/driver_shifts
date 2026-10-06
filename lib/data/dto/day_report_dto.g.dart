// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_report_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayReportDto _$DayReportDtoFromJson(Map<String, dynamic> json) => DayReportDto(
  date: json['date'] as String,
  summary: DaySummaryDto.fromJson(json['summary'] as Map<String, dynamic>),
  trips: (json['trips'] as List<dynamic>)
      .map((e) => TripDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DayReportDtoToJson(DayReportDto instance) =>
    <String, dynamic>{
      'date': instance.date,
      'summary': instance.summary.toJson(),
      'trips': instance.trips.map((e) => e.toJson()).toList(),
    };
