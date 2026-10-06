import 'package:flutter/material.dart';

import '../domain/model/payment_method.dart';

const kColorPrimary = Color(0xFF00796B);
const kColorCash = Color(0xFF2E7D32);
const kColorCard = Color(0xFF1565C0);

Color paymentColor(PaymentMethod payment) => switch (payment) {
  PaymentMethod.cash => kColorCash,
  PaymentMethod.card => kColorCard,
};
