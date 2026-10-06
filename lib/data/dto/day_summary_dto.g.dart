// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_summary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DaySummaryDto _$DaySummaryDtoFromJson(Map<String, dynamic> json) =>
    DaySummaryDto(
      tripsCount: (json['tripsCount'] as num).toInt(),
      revenue: (json['revenue'] as num).toInt(),
      commission: (json['commission'] as num).toInt(),
      net: (json['net'] as num).toInt(),
      cash: PaymentTotalDto.fromJson(json['cash'] as Map<String, dynamic>),
      card: PaymentTotalDto.fromJson(json['card'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DaySummaryDtoToJson(DaySummaryDto instance) =>
    <String, dynamic>{
      'tripsCount': instance.tripsCount,
      'revenue': instance.revenue,
      'commission': instance.commission,
      'net': instance.net,
      'cash': instance.cash.toJson(),
      'card': instance.card.toJson(),
    };

PaymentTotalDto _$PaymentTotalDtoFromJson(Map<String, dynamic> json) =>
    PaymentTotalDto(
      count: (json['count'] as num).toInt(),
      revenue: (json['revenue'] as num).toInt(),
    );

Map<String, dynamic> _$PaymentTotalDtoToJson(PaymentTotalDto instance) =>
    <String, dynamic>{'count': instance.count, 'revenue': instance.revenue};
