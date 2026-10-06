import 'package:flutter/foundation.dart';

/// Адрес бэкенда. Переопределяется: `--dart-define=API_BASE_URL=http://…`.
///
/// По умолчанию — локальный сервер из `server/`: на Android-эмуляторе
/// хост-машина доступна как 10.0.2.2, в вебе и на iOS-симуляторе — localhost.
abstract final class ApiConfig {
  static const _baseUrlOverride = String.fromEnvironment('API_BASE_URL');

  static String get baseUrl =>
      _baseUrlOverride.isNotEmpty ? _baseUrlOverride : 'http://$_host:8080';

  static String get _host =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.android
      ? '10.0.2.2'
      : 'localhost';
}
