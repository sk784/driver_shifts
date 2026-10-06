import '../domain/day_summary.dart';
import '../domain/offset_date_time.dart';
import '../domain/trip.dart';

class FieldError {
  const FieldError(this.field, this.message);

  final String field;
  final String message;

  Map<String, Object> toJson() => {'field': field, 'message': message};

  @override
  String toString() => '$field: $message';
}

sealed class TripParseResult {}

final class TripParsed extends TripParseResult {
  TripParsed(this.trip);

  final Trip trip;
}

final class TripInvalid extends TripParseResult {
  TripInvalid(this.errors);

  final List<FieldError> errors;
}

/// Разбор и проверка поездки из JSON. Собирает все ошибки сразу,
/// чтобы клиент мог подсветить все неверные поля за один ответ.
abstract final class TripJson {
  static const _maxIdLength = 64;

  static TripParseResult parse(Object? json) {
    if (json is! Map<String, Object?>) {
      return TripInvalid([const FieldError('body', 'ожидается JSON-объект')]);
    }
    final errors = <FieldError>[];

    final id = json['id'];
    if (id is! String || id.trim().isEmpty) {
      errors.add(const FieldError('id', 'обязательная непустая строка'));
    } else if (id.length > _maxIdLength) {
      errors.add(const FieldError('id', 'не длиннее $_maxIdLength символов'));
    }

    final start = _time(json, 'start', errors);
    final end = _time(json, 'end', errors);
    if (start != null && end != null && !end.isAfter(start)) {
      errors.add(const FieldError('end', 'окончание должно быть позже начала'));
    }

    final amount = _rubles(json, 'amount', errors);
    if (amount != null && amount <= 0) {
      errors.add(const FieldError('amount', 'сумма должна быть больше 0'));
    }

    final commission = _rubles(json, 'commission', errors);
    if (commission != null && commission < 0) {
      errors.add(
        const FieldError('commission', 'комиссия не может быть отрицательной'),
      );
    }
    if (amount != null &&
        amount > 0 &&
        commission != null &&
        commission > amount) {
      errors.add(
        const FieldError('commission', 'комиссия не может превышать сумму'),
      );
    }

    final payment = switch (json['payment']) {
      'cash' => PaymentMethod.cash,
      'card' => PaymentMethod.card,
      _ => null,
    };
    if (payment == null) {
      errors.add(const FieldError('payment', 'допустимо "cash" или "card"'));
    }

    if (errors.isNotEmpty) return TripInvalid(errors);
    return TripParsed(
      Trip(
        id: id as String,
        start: start!,
        end: end!,
        amount: amount!,
        payment: payment!,
        commission: commission!,
      ),
    );
  }

  static Map<String, Object> toJson(Trip trip) => {
    'id': trip.id,
    'start': trip.start.toIso8601String(),
    'end': trip.end.toIso8601String(),
    'amount': trip.amount,
    'payment': trip.payment.name,
    'commission': trip.commission,
  };

  static Map<String, Object> summaryToJson(DaySummary summary) => {
    'tripsCount': summary.tripsCount,
    'revenue': summary.revenue,
    'commission': summary.commission,
    'net': summary.net,
    'cash': _breakdownToJson(summary.cash),
    'card': _breakdownToJson(summary.card),
  };

  static Map<String, Object> _breakdownToJson(PaymentBreakdown b) => {
    'count': b.count,
    'revenue': b.revenue,
  };

  static OffsetDateTime? _time(
    Map<String, Object?> json,
    String field,
    List<FieldError> errors,
  ) {
    final value = json[field];
    final parsed = value is String ? OffsetDateTime.tryParse(value) : null;
    if (parsed == null) {
      errors.add(
        FieldError(
          field,
          'ожидается дата ISO 8601 со смещением, например 2026-10-01T08:10:00+05:00',
        ),
      );
    }
    return parsed;
  }

  /// `2400` и `2400.0` — допустимо, `2400.5` — нет: суммы в целых рублях.
  static int? _rubles(
    Map<String, Object?> json,
    String field,
    List<FieldError> errors,
  ) {
    final value = json[field];
    if (value is int) return value;
    if (value is double && value.isFinite && value == value.roundToDouble()) {
      return value.toInt();
    }
    errors.add(FieldError(field, 'ожидается целое число рублей'));
    return null;
  }
}
