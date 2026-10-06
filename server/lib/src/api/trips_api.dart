import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../data/trip_json.dart';
import '../domain/day_summary.dart';
import '../domain/offset_date_time.dart';
import '../domain/trip.dart';
import '../domain/trip_store.dart';

/// REST API:
///   GET  /days         — дни, в которых есть поездки
///   GET  /days/{date}  — поездки и сводка за день (`yyyy-MM-dd`)
///   POST /trips        — добавить поездку (идемпотентно по `id`)
class TripsApi {
  TripsApi(this._store, {void Function(TripStore store)? onChanged})
    : _onChanged = onChanged;

  final TripStore _store;
  final void Function(TripStore store)? _onChanged;

  static final _datePattern = RegExp(r'^\d{4}-\d{2}-\d{2}$');

  Handler get handler =>
      (Router()
            ..get('/health', (Request _) => _json(200, {'status': 'ok'}))
            ..get('/days', _days)
            ..get('/days/<date>', _day)
            ..post('/trips', _addTrip))
          .call;

  Response _days(Request request) => _json(200, {'days': _store.days()});

  Response _day(Request request, String date) {
    if (!_isValidDate(date)) {
      return _error(400, 'validation', 'Неверная дата. Пример: 2026-10-01');
    }
    final trips = _store.tripsOn(date);
    return _json(200, {
      'date': date,
      'summary': TripJson.summaryToJson(DaySummary.fromTrips(trips)),
      'trips': trips.map(TripJson.toJson).toList(),
    });
  }

  Future<Response> _addTrip(Request request) async {
    final Object? body;
    try {
      body = jsonDecode(await request.readAsString());
    } on FormatException {
      return _error(
        400,
        'validation',
        'Не получилось прочитать запрос: ожидается JSON',
      );
    }

    final Trip trip;
    switch (TripJson.parse(body)) {
      case TripParsed(trip: final parsed):
        trip = parsed;
      case TripInvalid(:final errors):
        return _json(400, {
          'error': 'validation',
          'message': 'Проверьте данные поездки',
          'details': errors.map((e) => e.toJson()).toList(),
        });
    }

    switch (_store.add(trip)) {
      case TripCreated(:final trip):
        _onChanged?.call(_store);
        return _json(201, TripJson.toJson(trip));
      case TripAlreadyExists(:final trip):
        return _json(200, TripJson.toJson(trip));
      case TripIdConflict():
        return _error(
          409,
          'id_conflict',
          'Эта поездка уже сохранена, но с другими данными',
        );
      case TripOverlap(trip: final other):
        return _error(
          409,
          'overlap',
          'В это время уже есть поездка '
              '${_clock(other.start)}–${_clock(other.end)}',
        );
    }
  }

  static String _clock(OffsetDateTime time) {
    final w = time.wallClock;
    return '${w.hour.toString().padLeft(2, '0')}:'
        '${w.minute.toString().padLeft(2, '0')}';
  }

  static bool _isValidDate(String date) {
    if (!_datePattern.hasMatch(date)) return false;
    final parsed = DateTime.tryParse(date);
    // DateTime.parse('2026-02-30') молча превращает дату в 2 марта.
    return parsed != null && date == parsed.toIso8601String().substring(0, 10);
  }

  static Response _error(int status, String code, String message) =>
      _json(status, {'error': code, 'message': message});

  static Response _json(int status, Object body) => Response(
    status,
    body: jsonEncode(body),
    headers: {'content-type': 'application/json; charset=utf-8'},
  );
}
