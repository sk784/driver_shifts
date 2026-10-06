import 'dart:async';

import 'package:driver_shifts/domain/model/day_report.dart';
import 'package:driver_shifts/domain/model/day_summary.dart';
import 'package:driver_shifts/domain/model/payment_total.dart';
import 'package:driver_shifts/domain/model/trip.dart';
import 'package:driver_shifts/domain/model/trip_id_generator.dart';
import 'package:driver_shifts/domain/repository/trips_repository.dart';

DayReport emptyReport(DateTime date) => DayReport(
  date: date,
  summary: const DaySummary(
    tripsCount: 0,
    revenue: 0,
    commission: 0,
    net: 0,
    cash: PaymentTotal(count: 0, revenue: 0),
    card: PaymentTotal(count: 0, revenue: 0),
  ),
  trips: const [],
);

/// Репозиторий, ответами которого управляет тест.
class FakeTripsRepository implements TripsRepository {
  List<DateTime> days = [];
  Object? daysError;

  /// День → ответ. Если для дня лежит Completer — ответ придёт, когда тест
  /// его завершит (для проверки ответов «не по порядку»).
  final dayResponses = <DateTime, Completer<DayReport>>{};
  final requestedDays = <DateTime>[];

  final sentTrips = <Trip>[];
  final addErrors = <Object>[];

  @override
  Future<List<DateTime>> getDays() async {
    if (daysError case final error?) throw error;
    return days;
  }

  @override
  Future<DayReport> getDay(DateTime date) {
    requestedDays.add(date);
    final completer = dayResponses[date];
    if (completer != null) return completer.future;
    return Future.value(emptyReport(date));
  }

  @override
  Future<void> addTrip(Trip trip) async {
    sentTrips.add(trip);
    if (addErrors.isNotEmpty) throw addErrors.removeAt(0);
  }
}

class SequentialIds implements TripIdGenerator {
  var _next = 0;

  @override
  String next() => 'id-${++_next}';
}
