import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_total.freezed.dart';

@freezed
abstract class PaymentTotal with _$PaymentTotal {
  const factory PaymentTotal({required int count, required int revenue}) =
      _PaymentTotal;
}
