import 'dart:io';

import 'package:driver_shifts_server/driver_shifts_server.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

/// Запуск: `dart run bin/server.dart` из папки `server/`.
///
/// Переменные окружения:
///   PORT        — порт (по умолчанию 8080)
///   SEED_FILE   — исходные данные (по умолчанию data/trips.json)
///   STORE_FILE  — куда сохранять добавленные поездки (по умолчанию .data/trips.json)
///
/// Исходный файл не перезаписываем: при первом старте поездки читаются из
/// SEED_FILE, дальше — из STORE_FILE. Чтобы начать с чистого листа,
/// удалите `.data/`.
Future<void> main() async {
  final env = Platform.environment;
  final port = int.tryParse(env['PORT'] ?? '') ?? 8080;
  final seed = TripsFile(File(env['SEED_FILE'] ?? 'data/trips.json'));
  final storage = TripsFile(File(env['STORE_FILE'] ?? '.data/trips.json'));

  final store = TripStore();
  (storage.file.existsSync() ? storage : seed).loadInto(store);

  final api = TripsApi(store, onChanged: (s) => storage.save(s.all()));
  final handler = const Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(cors())
      .addHandler(api.handler);

  final server = await io.serve(handler, InternetAddress.anyIPv4, port);
  print('Загружено поездок: ${store.length}');
  print('Сервер: http://localhost:${server.port}');
}
