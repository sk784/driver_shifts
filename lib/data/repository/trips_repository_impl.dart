import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/add_trip_exception.dart';
import '../../domain/model/day_report.dart';
import '../../domain/model/trip.dart';
import '../../domain/repository/trips_repository.dart';
import '../dto/api_error_dto.dart';
import '../mapper/trip_mapper.dart';
import '../remote/trips_api.dart';

@LazySingleton(as: TripsRepository)
class TripsRepositoryImpl implements TripsRepository {
  TripsRepositoryImpl(this._api, this._mapper);

  final TripsApi _api;
  final TripMapper _mapper;

  @override
  Future<List<DateTime>> getDays() async {
    final dto = await _api.getDays();
    return dto.days.map(_mapper.parseDate).toList(growable: false);
  }

  @override
  Future<DayReport> getDay(DateTime date) async {
    final dto = await _api.getDay(_mapper.formatDate(date));
    return _mapper.reportFromDto(dto);
  }

  @override
  Future<void> addTrip(Trip trip) async {
    try {
      await _api.addTrip(_mapper.toDto(trip));
    } on DioException catch (e) {
      throw _rejection(e) ?? e;
    }
  }

  /// 400/409 → доменная ошибка. Остальное (сеть, 5xx) отдаём как есть:
  /// такой запрос можно безопасно повторить.
  AddTripException? _rejection(DioException e) {
    final status = e.response?.statusCode;
    final data = e.response?.data;
    if (status != 400 && status != 409) return null;
    if (data is! Map<String, dynamic>) return null;

    final error = ApiErrorDto.fromJson(data);
    if (status == 409) return TripConflictException(error.message);
    return TripInvalidException(
      error.message,
      fieldErrors: {for (final d in error.details) d.field: d.message},
    );
  }
}
