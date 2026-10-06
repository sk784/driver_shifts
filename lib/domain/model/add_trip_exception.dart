/// Сервер отказался принять поездку. Сетевые ошибки сюда не попадают —
/// их можно ретраить, а эти нет.
sealed class AddTripException implements Exception {
  const AddTripException(this.message);

  final String message;

  @override
  String toString() => message;
}

/// Данные не прошли проверку (400).
final class TripInvalidException extends AddTripException {
  const TripInvalidException(super.message, {this.fieldErrors = const {}});

  /// Поле API (`amount`, `end`…) → сообщение.
  final Map<String, String> fieldErrors;
}

/// Поездка конфликтует с уже записанной (409): пересечение по времени
/// или тот же id с другими данными.
final class TripConflictException extends AddTripException {
  const TripConflictException(super.message);
}
