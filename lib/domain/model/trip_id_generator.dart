import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

/// Id поездки генерирует клиент: только так повтор запроса после обрыва
/// сети несёт тот же id, и сервер узнаёт в нём уже записанную поездку.
@injectable
class TripIdGenerator {
  static const _uuid = Uuid();

  String next() => _uuid.v4();
}
