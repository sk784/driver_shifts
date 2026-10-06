import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../dto/day_report_dto.dart';
import '../dto/days_dto.dart';
import '../dto/trip_dto.dart';

part 'trips_api.g.dart';

/// REST-клиент бэкенда (retrofit поверх Dio).
@injectable
@RestApi()
abstract class TripsApi {
  @factoryMethod
  factory TripsApi(Dio dio) = _TripsApi;

  @GET('/days')
  Future<DaysDto> getDays();

  @GET('/days/{date}')
  Future<DayReportDto> getDay(@Path('date') String date);

  @POST('/trips')
  Future<TripDto> addTrip(@Body() TripDto trip);
}
