import 'package:json_annotation/json_annotation.dart';

part 'trip_dto.g.dart';

/// Поездка «с провода». Время — ISO 8601 со смещением, как в исходном JSON.
@JsonSerializable()
class TripDto {
  const TripDto({
    required this.id,
    required this.start,
    required this.end,
    required this.amount,
    required this.payment,
    required this.commission,
  });

  final String id;
  final String start;
  final String end;
  final int amount;

  /// `cash` или `card`.
  final String payment;
  final int commission;

  factory TripDto.fromJson(Map<String, dynamic> json) =>
      _$TripDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TripDtoToJson(this);
}
