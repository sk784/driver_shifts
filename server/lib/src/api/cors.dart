import 'package:shelf/shelf.dart';

const _corsHeaders = {
  'access-control-allow-origin': '*',
  'access-control-allow-methods': 'GET, POST, OPTIONS',
  'access-control-allow-headers': 'content-type',
};

/// CORS для веб-клиента: Flutter web ходит на сервер с другого порта.
Middleware cors() =>
    (Handler inner) => (Request request) async {
      if (request.method == 'OPTIONS') {
        return Response.ok(null, headers: _corsHeaders);
      }
      final response = await inner(request);
      return response.change(headers: _corsHeaders);
    };
