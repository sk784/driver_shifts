import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/day_report.dart';

part 'day_state.freezed.dart';

/// Выбранный день есть в любом состоянии — переключатель дня виден всегда.
@freezed
sealed class DayState with _$DayState {
  const factory DayState.loading({required DateTime date}) = DayLoading;

  const factory DayState.success({
    required DateTime date,
    required DayReport report,
  }) = DaySuccess;

  const factory DayState.failure({
    required DateTime date,
    required String message,
  }) = DayFailure;
}
