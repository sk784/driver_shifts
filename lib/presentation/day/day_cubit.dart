import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/trips_repository.dart';
import '../../utils/error_messages.dart';
import 'day_state.dart';

@injectable
class DayCubit extends Cubit<DayState> {
  DayCubit(this._repository, @factoryParam DateTime? today)
    : super(DayState.loading(date: _dateOnly(today ?? DateTime.now()))) {
    init();
  }

  final TripsRepository _repository;

  bool _isInitialized = false;

  /// Номер последнего запроса дня. Пролистал дни быстро — ответы могут
  /// прийти не по порядку; применяем только ответ на последний запрос.
  int _request = 0;

  /// Стартовый день — последний день с поездками; если их нет — сегодня.
  Future<void> init() async {
    emit(DayState.loading(date: state.date));
    try {
      final days = await _repository.getDays();
      _isInitialized = true;
      await _load(days.isEmpty ? state.date : days.last);
    } catch (e) {
      if (isClosed) return;
      emit(DayState.failure(date: state.date, message: networkErrorMessage(e)));
    }
  }

  Future<void> previousDay() => _load(_shift(state.date, -1));

  Future<void> nextDay() => _load(_shift(state.date, 1));

  Future<void> selectDay(DateTime date) => _load(_dateOnly(date));

  Future<void> retry() => _isInitialized ? _load(state.date) : init();

  /// Перечитать день без спиннера — например, после добавления поездки.
  Future<void> refresh() => _load(state.date, isSilent: true);

  Future<void> _load(DateTime date, {bool isSilent = false}) async {
    final request = ++_request;
    if (!isSilent || state is! DaySuccess) {
      emit(DayState.loading(date: date));
    }
    try {
      final report = await _repository.getDay(date);
      if (request != _request || isClosed) return;
      emit(DayState.success(date: date, report: report));
    } catch (e) {
      if (request != _request || isClosed) return;
      emit(DayState.failure(date: date, message: networkErrorMessage(e)));
    }
  }

  /// Через конструктор, а не `add(Duration(days: 1))`: в день перевода
  /// часов в сутках 23 или 25 часов, и `add` съехал бы на соседнюю дату.
  static DateTime _shift(DateTime date, int days) =>
      DateTime(date.year, date.month, date.day + days);

  static DateTime _dateOnly(DateTime date) =>
      DateTime(date.year, date.month, date.day);
}
