import 'package:dio/dio.dart';

/// Понятный текст для сетевой ошибки.
String networkErrorMessage(Object error) {
  if (error is! DioException) return 'Что-то пошло не так.';
  return switch (error.type) {
    DioExceptionType.connectionTimeout ||
    DioExceptionType.receiveTimeout ||
    DioExceptionType.sendTimeout => 'Сервер не отвечает.',
    DioExceptionType.connectionError => 'Нет связи с сервером.',
    DioExceptionType.badResponse => 'Сервер вернул ошибку.',
    _ => 'Нет связи с сервером.',
  };
}
