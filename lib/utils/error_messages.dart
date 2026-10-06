import 'package:dio/dio.dart';

/// Понятный текст для сетевой ошибки.
String networkErrorMessage(Object error) {
  if (error is! DioException) return 'Что-то пошло не так.';
  return switch (error.type) {
    DioExceptionType.connectionTimeout ||
    DioExceptionType.receiveTimeout ||
    DioExceptionType.sendTimeout => 'Сервер долго не отвечает.',
    DioExceptionType.connectionError => 'Нет связи с сервером.',
    DioExceptionType.badResponse => 'На сервере что-то сломалось.',
    _ => 'Нет связи с сервером.',
  };
}
