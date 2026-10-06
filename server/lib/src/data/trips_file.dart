import 'dart:convert';
import 'dart:io';

import '../domain/trip.dart';
import '../domain/trip_store.dart';
import 'trip_json.dart';

/// Загрузка и сохранение поездок в JSON-файл.
class TripsFile {
  const TripsFile(this.file);

  final File file;

  /// Наполняет [store] поездками из файла. Файл проходит ту же проверку,
  /// что и POST: битая или пересекающаяся запись роняет старт с понятной
  /// ошибкой, а не тихо портит сводку.
  void loadInto(TripStore store) {
    final json = jsonDecode(file.readAsStringSync());
    if (json is! List) {
      throw FormatException('${file.path}: ожидается JSON-массив поездок');
    }
    for (final (index, item) in json.indexed) {
      final trip = switch (TripJson.parse(item)) {
        TripParsed(:final trip) => trip,
        TripInvalid(:final errors) => throw FormatException(
          '${file.path}[$index]: ${errors.join('; ')}',
        ),
      };
      switch (store.add(trip)) {
        case TripCreated():
        case TripAlreadyExists():
          break;
        case TripIdConflict(trip: final other):
        case TripOverlap(trip: final other):
          throw FormatException(
            '${file.path}[$index]: поездка ${trip.id} конфликтует с ${other.id}',
          );
      }
    }
  }

  /// Запись через временный файл и rename: при падении посреди записи
  /// старый файл остаётся целым. Синхронно — чтобы два POST подряд
  /// не перемешали записи.
  void save(List<Trip> trips) {
    file.parent.createSync(recursive: true);
    final tmp = File('${file.path}.tmp');
    tmp.writeAsStringSync(
      const JsonEncoder.withIndent(
        '  ',
      ).convert(trips.map(TripJson.toJson).toList()),
      flush: true,
    );
    tmp.renameSync(file.path);
  }
}
