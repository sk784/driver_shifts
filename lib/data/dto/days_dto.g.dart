// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'days_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DaysDto _$DaysDtoFromJson(Map<String, dynamic> json) => DaysDto(
  days: (json['days'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$DaysDtoToJson(DaysDto instance) => <String, dynamic>{
  'days': instance.days,
};
