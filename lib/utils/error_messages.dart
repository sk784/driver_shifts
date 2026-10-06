import 'package:dio/dio.dart';

/// Понятный текст для сетевой ошибки.
String networkErrorMessage(Object error) {
  if (error is! DioException) return 'Что-то пошло не так. Попробуйте ещё раз.';
  return switch (error.type) {
    DioExceptionType.connectionTimeout ||
    DioExceptionType.receiveTimeout ||
    DioExceptionType.sendTimeout => 'Сервер не отвечает. Проверьте соединение.',
    DioExceptionType.connectionError =>
      'Не удалось подключиться к серверу. Запущен ли server/?',
    DioExceptionType.badResponse =>
      'Ошибка сервера (${error.response?.statusCode}).',
    _ => 'Ошибка соединения. Попробуйте ещё раз.',
  };
}
