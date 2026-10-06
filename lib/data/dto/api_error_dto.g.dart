// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorDto _$ApiErrorDtoFromJson(Map<String, dynamic> json) => ApiErrorDto(
  error: json['error'] as String,
  message: json['message'] as String,
  details:
      (json['details'] as List<dynamic>?)
          ?.map((e) => FieldErrorDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$ApiErrorDtoToJson(ApiErrorDto instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'details': instance.details.map((e) => e.toJson()).toList(),
    };

FieldErrorDto _$FieldErrorDtoFromJson(Map<String, dynamic> json) =>
    FieldErrorDto(
      field: json['field'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$FieldErrorDtoToJson(FieldErrorDto instance) =>
    <String, dynamic>{'field': instance.field, 'message': instance.message};
