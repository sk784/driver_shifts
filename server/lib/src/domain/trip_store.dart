import 'trip.dart';

sealed class AddTripResult {
  const AddTripResult(this.trip);

  final Trip trip;
}

/// Новая поездка сохранена.
final class TripCreated extends AddTripResult {
  const TripCreated(super.trip);
}

/// Повтор той же поездки (тот же id, те же данные) — дубль не создаём,
/// отвечаем как на первую отправку. Так клиент может безопасно ретраить.
final class TripAlreadyExists extends AddTripResult {
  const TripAlreadyExists(super.trip);
}

/// Тот же id, но другие данные — это не повтор, а ошибка клиента.
final class TripIdConflict extends AddTripResult {
  const TripIdConflict(super.trip);
}

/// Другой id, но время пересекается с уже записанной поездкой.
/// Водитель не может везти два заказа сразу — скорее всего это та же
/// поездка, отправленная повторно под новым id.
final class TripOverlap extends AddTripResult {
  const TripOverlap(super.trip);
}

/// Хранилище поездок в памяти.
///
/// Все операции синхронные, а shelf обрабатывает запросы в одном изоляте,
/// поэтому «проверить и вставить» атомарно — гонки двух одинаковых POST нет.
class TripStore {
  final _byId = <String, Trip>{};
  final _byDate = <String, List<Trip>>{};

  int get length => _byId.length;

  AddTripResult add(Trip trip) {
    final existing = _byId[trip.id];
    if (existing != null) {
      return existing == trip
          ? TripAlreadyExists(existing)
          : TripIdConflict(existing);
    }
    for (final other in _byId.values) {
      if (other.overlaps(trip)) return TripOverlap(other);
    }

    _byId[trip.id] = trip;
    final day = _byDate.putIfAbsent(trip.date, () => []);
    final index = day.indexWhere((t) => t.start.isAfter(trip.start));
    day.insert(index == -1 ? day.length : index, trip);
    return TripCreated(trip);
  }

  /// Поездки дня, отсортированные по началу.
  List<Trip> tripsOn(String date) => List.unmodifiable(_byDate[date] ?? []);

  /// Дни, в которых есть поездки, по возрастанию.
  List<String> days() => _byDate.keys.toList()..sort();

  List<Trip> all() => days().expand(tripsOn).toList();
}
