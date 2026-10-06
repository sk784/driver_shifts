import 'package:driver_shifts_server/driver_shifts_server.dart';

OffsetDateTime at(String iso) => OffsetDateTime.tryParse(iso)!;

Trip trip({
  String id = 't1',
  String start = '2026-10-01T08:10:00+05:00',
  String end = '2026-10-01T08:32:00+05:00',
  int amount = 2400,
  PaymentMethod payment = PaymentMethod.card,
  int commission = 360,
}) => Trip(
  id: id,
  start: at(start),
  end: at(end),
  amount: amount,
  payment: payment,
  commission: commission,
);
