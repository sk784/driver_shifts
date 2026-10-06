import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:driver_shifts/domain/model/day_report.dart';
import 'package:driver_shifts/presentation/day/day_cubit.dart';
import 'package:driver_shifts/presentation/day/day_state.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fakes.dart';

void main() {
  final today = DateTime(2026, 10, 6);
  late FakeTripsRepository repository;

  setUp(() => repository = FakeTripsRepository());

  DayCubit build() => DayCubit(repository, today);

  blocTest<DayCubit, DayState>(
    'стартует с последнего дня, в котором есть поездки',
    setUp: () =>
        repository.days = [DateTime(2026, 10, 1), DateTime(2026, 10, 5)],
    build: build,
    expect: () => [
      DayState.loading(date: DateTime(2026, 10, 5)),
      DayState.success(
        date: DateTime(2026, 10, 5),
        report: emptyReport(DateTime(2026, 10, 5)),
      ),
    ],
  );

  blocTest<DayCubit, DayState>(
    'нет ни одного дня с поездками — показывает сегодня',
    build: build,
    expect: () => [DayState.success(date: today, report: emptyReport(today))],
  );

  blocTest<DayCubit, DayState>(
    'переключение дней вперёд и назад',
    build: build,
    act: (cubit) async {
      await Future<void>.delayed(Duration.zero);
      await cubit.nextDay();
      await cubit.previousDay();
      await cubit.previousDay();
    },
    skip: 1,
    verify: (_) => expect(repository.requestedDays, [
      today,
      DateTime(2026, 10, 7),
      today,
      DateTime(2026, 10, 5),
    ]),
  );

  blocTest<DayCubit, DayState>(
    'переход через границу месяца',
    build: () => DayCubit(repository, DateTime(2026, 10, 31)),
    act: (cubit) async {
      await Future<void>.delayed(Duration.zero);
      await cubit.nextDay();
    },
    verify: (cubit) => expect(cubit.state.date, DateTime(2026, 11, 1)),
  );

  test('запоздавший ответ по старому дню не перетирает новый', () async {
    final slow = Completer<DayReport>();
    final cubit = build();
    await Future<void>.delayed(Duration.zero);
    repository.dayResponses[DateTime(2026, 10, 7)] = slow;

    unawaited(cubit.nextDay()); // 7-е — ответ задерживается
    await cubit.selectDay(DateTime(2026, 10, 1)); // 1-е — ответ сразу
    slow.complete(emptyReport(DateTime(2026, 10, 7)));
    await Future<void>.delayed(Duration.zero);

    expect(cubit.state, isA<DaySuccess>());
    expect(cubit.state.date, DateTime(2026, 10, 1));
    await cubit.close();
  });

  blocTest<DayCubit, DayState>(
    'сервер недоступен на старте → ошибка, retry повторяет инициализацию',
    setUp: () => repository.daysError = DioException.connectionError(
      requestOptions: RequestOptions(path: '/days'),
      reason: 'offline',
    ),
    build: build,
    act: (cubit) async {
      await Future<void>.delayed(Duration.zero);
      repository
        ..daysError = null
        ..days = [DateTime(2026, 10, 2)];
      await cubit.retry();
    },
    expect: () => [
      isA<DayFailure>(),
      DayState.loading(date: today),
      DayState.loading(date: DateTime(2026, 10, 2)),
      isA<DaySuccess>(),
    ],
  );

  blocTest<DayCubit, DayState>(
    'refresh после добавления — без спиннера',
    build: build,
    act: (cubit) async {
      await Future<void>.delayed(Duration.zero);
      await cubit.refresh();
    },
    skip: 1,
    verify: (_) => expect(repository.requestedDays, [today, today]),
    expect: () => <DayState>[],
  );
}
