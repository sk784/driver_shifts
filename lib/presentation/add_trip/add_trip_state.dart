import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/payment_method.dart';
import 'add_trip_field.dart';

part 'add_trip_state.freezed.dart';

@freezed
abstract class AddTripState with _$AddTripState {
  const factory AddTripState({
    /// День, в который добавляем поездку (выбранный на главном экране).
    required DateTime date,
    TimeOfDay? start,
    TimeOfDay? end,

    /// Окончание после полуночи — ночная поездка.
    @Default(false) bool isEndNextDay,
    @Default('') String amount,
    @Default('') String commission,
    @Default(PaymentMethod.card) PaymentMethod payment,
    @Default({}) Map<AddTripField, String> fieldErrors,

    /// Ошибка, не относящаяся к конкретному полю (сеть, пересечение).
    String? message,
    @Default(false) bool isSubmitting,
    @Default(false) bool isSaved,
  }) = _AddTripState;
}
