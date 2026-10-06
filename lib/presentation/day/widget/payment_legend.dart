import 'package:flutter/material.dart';

import '../../../domain/model/payment_method.dart';
import '../../../domain/model/payment_total.dart';
import '../../../utils/colors.dart';
import '../../../utils/formatters.dart';

class PaymentLegend extends StatelessWidget {
  const PaymentLegend({super.key, required this.payment, required this.total});

  final PaymentMethod payment;
  final PaymentTotal total;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 8),
            child: CircleAvatar(
              radius: 4,
              backgroundColor: paymentColor(payment),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(paymentTitle(payment), style: theme.textTheme.bodySmall),
                Text(
                  formatMoney(total.revenue),
                  style: theme.textTheme.titleSmall,
                ),
                Text(
                  formatTripsCount(total.count),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
