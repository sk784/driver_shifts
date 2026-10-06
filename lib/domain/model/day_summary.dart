import 'package:freezed_annotation/freezed_annotation.dart';

import 'payment_total.dart';

part 'day_summary.freezed.dart';

/// Сводка за день. Считается на сервере — клиент её только показывает,
/// чтобы правило расчёта было в одном месте.
@freezed
abstract class DaySummary with _$DaySummary {
  const factory DaySummary({
    required int tripsCount,
    required int revenue,
    required int commission,

    /// «На руки» = выручка − комиссия.
    required int net,
    required PaymentTotal cash,
    required PaymentTotal card,
  }) = _DaySummary;
}
