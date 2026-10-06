import '../model/add_trip_exception.dart';
import '../model/day_report.dart';
import '../model/trip.dart';

/// Контракт доступа к поездкам. Ошибки пробрасываются исключениями:
/// отказ сервера — [AddTripException], сеть — как есть (DioException).
abstract interface class TripsRepository {
  /// Дни, в которых есть поездки, по возрастанию.
  Future<List<DateTime>> getDays();

  /// Поездки и сводка за день.
  Future<DayReport> getDay(DateTime date);

  /// Добавить поездку. Повтор с тем же [Trip.id] и теми же данными
  /// безопасен — сервер не создаст дубль.
  Future<void> addTrip(Trip trip);
}
