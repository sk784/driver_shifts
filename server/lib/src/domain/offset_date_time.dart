/// Момент времени вместе со смещением, в котором его записал водитель.
///
/// `DateTime.parse` приводит строку со смещением к UTC и смещение теряет.
/// Нам оно нужно: «день» поездки — это календарный день водителя, а не UTC.
/// Поездка `2026-10-01T02:00:00+05:00` в UTC — это ещё 30 сентября.
class OffsetDateTime implements Comparable<OffsetDateTime> {
  OffsetDateTime(DateTime instant, this.offset) : instant = instant.toUtc();

  /// Принимает только ISO 8601 с явным смещением (`Z` или `±hh:mm`).
  /// Время без смещения неоднозначно: непонятно, к какому дню его относить.
  static OffsetDateTime? tryParse(String value) {
    final match = _pattern.firstMatch(value);
    if (match == null) return null;
    final parsed = DateTime.tryParse(value);
    if (parsed == null) return null;
    // Точность — секунда: доли отбрасываем, чтобы запись в файл и обратно
    // не меняла поездку (иначе повтор после рестарта стал бы конфликтом).
    final instant = parsed.subtract(
      Duration(
        milliseconds: parsed.millisecond,
        microseconds: parsed.microsecond,
      ),
    );

    final zone = match.group(1)!;
    final Duration offset;
    if (zone == 'Z') {
      offset = Duration.zero;
    } else {
      final sign = zone.startsWith('-') ? -1 : 1;
      final hours = int.parse(zone.substring(1, 3));
      final minutes = int.parse(zone.substring(4, 6));
      if (hours > 14 || minutes > 59) return null;
      offset = Duration(hours: hours, minutes: minutes) * sign;
    }

    final result = OffsetDateTime(instant, offset);
    // DateTime.parse не валидирует диапазоны: `2026-13-01` или `02-30`
    // молча переезжают в следующий месяц. Ловим это обратной сборкой.
    final hasSeconds = value.length > 16 && value[16] == ':';
    final wallClock = result.toIso8601String().substring(
      0,
      hasSeconds ? 19 : 16,
    );
    return value.startsWith(wallClock) ? result : null;
  }

  static final _pattern = RegExp(
    r'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}(?::\d{2}(?:\.\d{1,6})?)?(Z|[+-]\d{2}:\d{2})$',
  );

  /// Абсолютный момент (UTC) — по нему сравниваем и проверяем пересечения.
  final DateTime instant;
  final Duration offset;

  /// Часы на руке водителя. Флаг `isUtc` тут технический — читаем только поля.
  DateTime get wallClock => instant.add(offset);

  /// Календарный день водителя, `yyyy-MM-dd`.
  String get localDate {
    final w = wallClock;
    return '${_pad(w.year, 4)}-${_pad(w.month)}-${_pad(w.day)}';
  }

  bool isBefore(OffsetDateTime other) => instant.isBefore(other.instant);

  bool isAfter(OffsetDateTime other) => instant.isAfter(other.instant);

  /// Каноничная запись: `2026-10-01T08:10:00+05:00`.
  String toIso8601String() {
    final w = wallClock;
    final date = '${_pad(w.year, 4)}-${_pad(w.month)}-${_pad(w.day)}';
    final time = '${_pad(w.hour)}:${_pad(w.minute)}:${_pad(w.second)}';
    return '${date}T$time${_formatOffset()}';
  }

  String _formatOffset() {
    if (offset == Duration.zero) return 'Z';
    final sign = offset.isNegative ? '-' : '+';
    final minutes = offset.inMinutes.abs();
    return '$sign${_pad(minutes ~/ 60)}:${_pad(minutes % 60)}';
  }

  static String _pad(int value, [int width = 2]) =>
      value.toString().padLeft(width, '0');

  @override
  int compareTo(OffsetDateTime other) => instant.compareTo(other.instant);

  @override
  bool operator ==(Object other) =>
      other is OffsetDateTime &&
      other.instant == instant &&
      other.offset == offset;

  @override
  int get hashCode => Object.hash(instant, offset);

  @override
  String toString() => toIso8601String();
}
