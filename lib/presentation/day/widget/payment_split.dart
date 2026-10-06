import 'package:flutter/material.dart';

import '../../../domain/model/payment_method.dart';
import '../../../domain/model/payment_total.dart';
import '../../../utils/colors.dart';
import 'payment_legend.dart';

/// Полоса «наличные / карта» пропорционально выручке + легенда.
class PaymentSplit extends StatelessWidget {
  const PaymentSplit({super.key, required this.cash, required this.card});

  final PaymentTotal cash;
  final PaymentTotal card;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: SizedBox(
            height: 8,
            child: Row(
              children: [
                if (cash.revenue > 0)
                  Expanded(
                    flex: cash.revenue,
                    child: const ColoredBox(color: kColorCash),
                  ),
                if (card.revenue > 0)
                  Expanded(
                    flex: card.revenue,
                    child: const ColoredBox(color: kColorCard),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            PaymentLegend(payment: PaymentMethod.cash, total: cash),
            PaymentLegend(payment: PaymentMethod.card, total: card),
          ],
        ),
      ],
    );
  }
}
