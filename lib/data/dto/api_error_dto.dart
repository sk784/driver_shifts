import 'package:json_annotation/json_annotation.dart';

part 'api_error_dto.g.dart';

/// Тело ошибки сервера: `{error, message, details?}`.
@JsonSerializable()
class ApiErrorDto {
  const ApiErrorDto({
    required this.error,
    required this.message,
    this.details = const [],
  });

  /// `validation`, `id_conflict`, `overlap`.
  final String error;
  final String message;
  final List<FieldErrorDto> details;

  factory ApiErrorDto.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorDtoToJson(this);
}

@JsonSerializable()
class FieldErrorDto {
  const FieldErrorDto({required this.field, required this.message});

  final String field;
  final String message;

  factory FieldErrorDto.fromJson(Map<String, dynamic> json) =>
      _$FieldErrorDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FieldErrorDtoToJson(this);
}
