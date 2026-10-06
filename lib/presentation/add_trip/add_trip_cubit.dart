import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/add_trip_exception.dart';
import '../../domain/model/payment_method.dart';
import '../../domain/model/trip.dart';
import '../../domain/model/trip_id_generator.dart';
import '../../domain/model/trip_time.dart';
import '../../domain/repository/trips_repository.dart';
import '../../utils/error_messages.dart';
import 'add_trip_field.dart';
import 'add_trip_state.dart';

@injectable
class AddTripCubit extends Cubit<AddTripState> {
  AddTripCubit(this._repository, this._ids, @factoryParam DateTime date)
    : super(AddTripState(date: date));

  static const _maxTripDuration = Duration(hours: 24);

  final TripsRepository _repository;
  final TripIdGenerator _ids;

  /// Последняя отправленная поездка. Если пользователь жмёт «Сохранить»
  /// повторно с теми же данными (например, после таймаута), уходит тот же id —
  /// сервер ответит «уже есть» вместо дубля. Изменил данные — новый id.
  Trip? _lastSent;

  void changeStart(TimeOfDay value) =>
      _edit(state.copyWith(start: value), AddTripField.start);

  void changeEnd(TimeOfDay value) =>
      _edit(state.copyWith(end: value), AddTripField.end);

  void changeEndNextDay(bool value) =>
      _edit(state.copyWith(isEndNextDay: value), AddTripField.end);

  void changeAmount(String value) =>
      _edit(state.copyWith(amount: value), AddTripField.amount);

  void changeCommission(String value) =>
      _edit(state.copyWith(commission: value), AddTripField.commission);

  void changePayment(PaymentMethod value) =>
      emit(state.copyWith(payment: value, message: null));

  Future<void> submit() async {
    if (state.isSubmitting || state.isSaved) return;

    final errors = _validate();
    if (errors.isNotEmpty) {
      emit(state.copyWith(fieldErrors: errors, message: null));
      return;
    }

    final trip = _buildTrip();
    _lastSent = trip;
    emit(state.copyWith(isSubmitting: true, message: null));
    try {
      await _repository.addTrip(trip);
      if (isClosed) return;
      emit(state.copyWith(isSubmitting: false, isSaved: true));
    } on TripInvalidException catch (e) {
      if (isClosed) return;
      final fieldErrors = _serverFieldErrors(e.fieldErrors);
      emit(
        state.copyWith(
          isSubmitting: false,
          fieldErrors: fieldErrors,
          message: fieldErrors.isEmpty ? e.message : null,
        ),
      );
    } on TripConflictException catch (e) {
      if (isClosed) return;
      emit(state.copyWith(isSubmitting: false, message: e.message));
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(
          isSubmitting: false,
          message:
              '${networkErrorMessage(e)} Поездка не сохранена. '
              'Нажмите «Сохранить» ещё раз — дубля не будет.',
        ),
      );
    }
  }

  void _edit(AddTripState next, AddTripField field) {
    final errors = Map.of(next.fieldErrors)..remove(field);
    emit(next.copyWith(fieldErrors: errors, message: null));
  }

  Map<AddTripField, String> _validate() {
    final errors = <AddTripField, String>{};
    if (state.start == null) errors[AddTripField.start] = 'Когда началась?';
    if (state.end == null) errors[AddTripField.end] = 'Когда закончилась?';

    final amount = int.tryParse(state.amount.trim());
    if (state.amount.trim().isEmpty) {
      errors[AddTripField.amount] = 'Укажите сумму';
    } else if (amount == null || amount <= 0) {
      errors[AddTripField.amount] = 'Сумма должна быть больше нуля';
    }

    final commissionText = state.commission.trim();
    final commission = commissionText.isEmpty
        ? 0
        : int.tryParse(commissionText);
    if (commission == null || commission < 0) {
      errors[AddTripField.commission] = 'Проверьте комиссию';
    } else if (amount != null && amount > 0 && commission > amount) {
      errors[AddTripField.commission] = 'Комиссия больше суммы поездки';
    }

    if (errors.containsKey(AddTripField.start) ||
        errors.containsKey(AddTripField.end)) {
      return errors;
    }
    final (start, end) = _times();
    if (!end.isAfter(start)) {
      errors[AddTripField.end] =
          'Закончилась раньше, чем началась. Если после полуночи — '
          'включите переключатель ниже';
    } else if (end.instant.difference(start.instant) > _maxTripDuration) {
      errors[AddTripField.end] =
          'Поездка дольше суток. Точно закончилась после полуночи?';
    }
    return errors;
  }

  (TripTime, TripTime) _times() {
    final start = state.start!;
    final end = state.end!;
    final endDate = state.isEndNextDay
        ? DateTime(state.date.year, state.date.month, state.date.day + 1)
        : state.date;
    return (
      TripTime.deviceLocal(state.date, start.hour, start.minute),
      TripTime.deviceLocal(endDate, end.hour, end.minute),
    );
  }

  Trip _buildTrip() {
    final (start, end) = _times();
    final commission = state.commission.trim();
    final draft = Trip(
      id: '',
      start: start,
      end: end,
      amount: int.parse(state.amount.trim()),
      payment: state.payment,
      commission: commission.isEmpty ? 0 : int.parse(commission),
    );
    final last = _lastSent;
    final isRetry = last != null && last.copyWith(id: '') == draft;
    return draft.copyWith(id: isRetry ? last.id : _ids.next());
  }

  Map<AddTripField, String> _serverFieldErrors(Map<String, String> errors) => {
    for (final field in AddTripField.values) field: ?errors[field.apiName],
  };
}
