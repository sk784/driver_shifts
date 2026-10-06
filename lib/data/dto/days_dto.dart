import 'package:json_annotation/json_annotation.dart';

part 'days_dto.g.dart';

/// Ответ `GET /days`.
@JsonSerializable()
class DaysDto {
  const DaysDto({required this.days});

  /// `yyyy-MM-dd`, по возрастанию.
  final List<String> days;

  factory DaysDto.fromJson(Map<String, dynamic> json) =>
      _$DaysDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DaysDtoToJson(this);
}
