import 'package:json_annotation/json_annotation.dart';

part 'day_summary_dto.g.dart';

@JsonSerializable()
class DaySummaryDto {
  const DaySummaryDto({
    required this.tripsCount,
    required this.revenue,
    required this.commission,
    required this.net,
    required this.cash,
    required this.card,
  });

  final int tripsCount;
  final int revenue;
  final int commission;
  final int net;
  final PaymentTotalDto cash;
  final PaymentTotalDto card;

  factory DaySummaryDto.fromJson(Map<String, dynamic> json) =>
      _$DaySummaryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DaySummaryDtoToJson(this);
}

@JsonSerializable()
class PaymentTotalDto {
  const PaymentTotalDto({required this.count, required this.revenue});

  final int count;
  final int revenue;

  factory PaymentTotalDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentTotalDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentTotalDtoToJson(this);
}
