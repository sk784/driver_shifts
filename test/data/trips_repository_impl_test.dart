import 'package:dio/dio.dart';
import 'package:driver_shifts/data/dto/day_report_dto.dart';
import 'package:driver_shifts/data/dto/days_dto.dart';
import 'package:driver_shifts/data/dto/trip_dto.dart';
import 'package:driver_shifts/data/mapper/trip_mapper.dart';
import 'package:driver_shifts/data/remote/trips_api.dart';
import 'package:driver_shifts/data/repository/trips_repository_impl.dart';
import 'package:driver_shifts/domain/model/add_trip_exception.dart';
import 'package:flutter_test/flutter_test.dart';

class _FailingApi implements TripsApi {
  _FailingApi(this.error);

  final DioException error;

  @override
  Future<TripDto> addTrip(TripDto trip) => Future.error(error);

  @override
  Future<DayReportDto> getDay(String date) => throw UnimplementedError();

  @override
  Future<DaysDto> getDays() => throw UnimplementedError();
}

DioException _response(int status, Object data) {
  final options = RequestOptions(path: '/trips');
  return DioException.badResponse(
    statusCode: status,
    requestOptions: options,
    response: Response(requestOptions: options, statusCode: status, data: data),
  );
}

void main() {
  final mapper = TripMapper();
  final trip = mapper.fromDto(
    const TripDto(
      id: 't1',
      start: '2026-10-01T08:10:00+05:00',
      end: '2026-10-01T08:32:00+05:00',
      amount: 2400,
      payment: 'card',
      commission: 360,
    ),
  );

  Future<void> add(DioException error) =>
      TripsRepositoryImpl(_FailingApi(error), mapper).addTrip(trip);

  test('400 → TripInvalidException с ошибками по полям', () async {
    final error = _response(400, {
      'error': 'validation',
      'message': 'Проверьте данные поездки',
      'details': [
        {'field': 'amount', 'message': 'сумма должна быть больше 0'},
      ],
    });

    await expectLater(
      add(error),
      throwsA(
        isA<TripInvalidException>().having(
          (e) => e.fieldErrors,
          'fieldErrors',
          {'amount': 'сумма должна быть больше 0'},
        ),
      ),
    );
  });

  test('409 → TripConflictException с текстом сервера', () async {
    final error = _response(409, {
      'error': 'overlap',
      'message': 'Время пересекается с поездкой t1',
    });

    await expectLater(
      add(error),
      throwsA(
        isA<TripConflictException>().having(
          (e) => e.message,
          'message',
          'Время пересекается с поездкой t1',
        ),
      ),
    );
  });

  test('500 и обрыв сети — остаются DioException (можно ретраить)', () async {
    await expectLater(
      add(_response(500, 'oops')),
      throwsA(isA<DioException>()),
    );
    await expectLater(
      add(
        DioException.connectionError(
          requestOptions: RequestOptions(path: '/trips'),
          reason: 'offline',
        ),
      ),
      throwsA(isA<DioException>()),
    );
  });
}
