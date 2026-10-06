// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:driver_shifts/data/mapper/trip_mapper.dart' as _i672;
import 'package:driver_shifts/data/remote/trips_api.dart' as _i376;
import 'package:driver_shifts/data/repository/trips_repository_impl.dart'
    as _i420;
import 'package:driver_shifts/domain/model/trip_id_generator.dart' as _i715;
import 'package:driver_shifts/domain/repository/trips_repository.dart' as _i437;
import 'package:driver_shifts/injectable/injectable.dart' as _i549;
import 'package:driver_shifts/presentation/add_trip/add_trip_cubit.dart'
    as _i283;
import 'package:driver_shifts/presentation/day/day_cubit.dart' as _i720;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.factory<_i672.TripMapper>(() => _i672.TripMapper());
    gh.factory<_i715.TripIdGenerator>(() => _i715.TripIdGenerator());
    gh.singleton<_i361.Dio>(() => networkModule.dio);
    gh.factory<_i376.TripsApi>(() => _i376.TripsApi(gh<_i361.Dio>()));
    gh.lazySingleton<_i437.TripsRepository>(
      () => _i420.TripsRepositoryImpl(
        gh<_i376.TripsApi>(),
        gh<_i672.TripMapper>(),
      ),
    );
    gh.factoryParam<_i283.AddTripCubit, DateTime, dynamic>(
      (date, _) => _i283.AddTripCubit(
        gh<_i437.TripsRepository>(),
        gh<_i715.TripIdGenerator>(),
        date,
      ),
    );
    gh.factoryParam<_i720.DayCubit, DateTime?, dynamic>(
      (today, _) => _i720.DayCubit(gh<_i437.TripsRepository>(), today),
    );
    return this;
  }
}

class _$NetworkModule extends _i549.NetworkModule {}
