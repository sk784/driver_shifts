import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:driver_shifts/domain/model/add_trip_exception.dart';
import 'package:driver_shifts/domain/model/payment_method.dart';
import 'package:driver_shifts/presentation/add_trip/add_trip_cubit.dart';
import 'package:driver_shifts/presentation/add_trip/add_trip_field.dart';
import 'package:driver_shifts/presentation/add_trip/add_trip_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fakes.dart';

void main() {
  final date = DateTime(2026, 10, 1);
  late FakeTripsRepository repository;

  setUp(() => repository = FakeTripsRepository());

  AddTripCubit build() => AddTripCubit(repository, SequentialIds(), date);

  void fill(AddTripCubit cubit) => cubit
    ..changeStart(const TimeOfDay(hour: 8, minute: 10))
    ..changeEnd(const TimeOfDay(hour: 8, minute: 32))
    ..changeAmount('2400')
    ..changeCommission('360')
    ..changePayment(PaymentMethod.card);

  DioException offline() => DioException.connectionError(
    requestOptions: RequestOptions(path: '/trips'),
    reason: 'offline',
  );

  test('повтор после обрыва сети уходит с тем же id', () async {
    repository.addErrors.add(offline());
    final cubit = build();
    fill(cubit);

    await cubit.submit();
    expect(cubit.state.isSaved, isFalse);
    expect(cubit.state.message, contains('дубль не создастся'));

    await cubit.submit();
    expect(cubit.state.isSaved, isTrue);
    expect(repository.sentTrips.map((t) => t.id), ['id-1', 'id-1']);
    await cubit.close();
  });

  test('изменили данные после ошибки — новый id', () async {
    repository.addErrors.add(offline());
    final cubit = build();
    fill(cubit);

    await cubit.submit();
    cubit.changeAmount('2500');
    await cubit.submit();

    expect(repository.sentTrips.map((t) => t.id), ['id-1', 'id-2']);
    expect(repository.sentTrips.last.amount, 2500);
    await cubit.close();
  });

  test('вернули прежние данные — снова прежний id', () async {
    repository.addErrors.addAll([offline(), offline()]);
    final cubit = build();
    fill(cubit);

    await cubit.submit();
    cubit
      ..changeAmount('2500')
      ..changeAmount('2400');
    await cubit.submit();

    expect(repository.sentTrips.map((t) => t.id), ['id-1', 'id-1']);
    await cubit.close();
  });

  test('после успешного сохранения повторное нажатие ничего не шлёт', () async {
    final cubit = build();
    fill(cubit);

    await cubit.submit();
    await cubit.submit();

    expect(repository.sentTrips, hasLength(1));
    await cubit.close();
  });

  blocTest<AddTripCubit, AddTripState>(
    'пустая форма — ошибки полей, на сервер ничего не уходит',
    build: build,
    act: (cubit) => cubit.submit(),
    verify: (cubit) {
      expect(cubit.state.fieldErrors.keys, {
        AddTripField.start,
        AddTripField.end,
        AddTripField.amount,
      });
      expect(repository.sentTrips, isEmpty);
    },
  );

  blocTest<AddTripCubit, AddTripState>(
    'окончание не позже начала — ошибка',
    build: build,
    act: (cubit) {
      fill(cubit);
      cubit.changeEnd(const TimeOfDay(hour: 8, minute: 10));
      return cubit.submit();
    },
    verify: (cubit) {
      expect(cubit.state.fieldErrors.keys, [AddTripField.end]);
      expect(repository.sentTrips, isEmpty);
    },
  );

  test('ночная поездка: окончание на следующий день', () async {
    final cubit = build();
    fill(cubit);
    cubit
      ..changeStart(const TimeOfDay(hour: 23, minute: 48))
      ..changeEnd(const TimeOfDay(hour: 0, minute: 21))
      ..changeEndNextDay(true);

    await cubit.submit();

    final trip = repository.sentTrips.single;
    expect(trip.start.localDate, date);
    expect(trip.end.localDate, DateTime(2026, 10, 2));
    expect(trip.duration, const Duration(minutes: 33));
    await cubit.close();
  });

  test('комиссия больше суммы — ошибка', () async {
    final cubit = build();
    fill(cubit);
    cubit.changeCommission('5000');

    await cubit.submit();

    expect(cubit.state.fieldErrors.keys, [AddTripField.commission]);
    await cubit.close();
  });

  test('пустая комиссия = 0', () async {
    final cubit = build();
    fill(cubit);
    cubit.changeCommission('');

    await cubit.submit();

    expect(repository.sentTrips.single.commission, 0);
    await cubit.close();
  });

  test('ошибки сервера раскладываются по полям', () async {
    repository.addErrors.add(
      const TripInvalidException(
        'Проверьте данные',
        fieldErrors: {'amount': 'сумма должна быть больше 0'},
      ),
    );
    final cubit = build();
    fill(cubit);

    await cubit.submit();

    expect(cubit.state.fieldErrors, {
      AddTripField.amount: 'сумма должна быть больше 0',
    });
    expect(cubit.state.message, isNull);
    await cubit.close();
  });

  test(
    'ошибка сервера по полю, которого нет в форме — общим текстом',
    () async {
      repository.addErrors.add(
        const TripInvalidException(
          'Проверьте данные',
          fieldErrors: {'id': 'x'},
        ),
      );
      final cubit = build();
      fill(cubit);

      await cubit.submit();

      expect(cubit.state.message, 'Проверьте данные');
      await cubit.close();
    },
  );

  test('конфликт (пересечение) — текст сервера', () async {
    repository.addErrors.add(
      const TripConflictException('Время пересекается с поездкой t1'),
    );
    final cubit = build();
    fill(cubit);

    await cubit.submit();

    expect(cubit.state.message, 'Время пересекается с поездкой t1');
    expect(cubit.state.isSaved, isFalse);
    await cubit.close();
  });

  test('правка поля снимает его ошибку', () async {
    final cubit = build();
    await cubit.submit();
    cubit.changeAmount('100');

    expect(cubit.state.fieldErrors.containsKey(AddTripField.amount), isFalse);
    expect(cubit.state.fieldErrors.containsKey(AddTripField.start), isTrue);
    await cubit.close();
  });
}
