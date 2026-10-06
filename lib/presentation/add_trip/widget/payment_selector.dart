import 'package:flutter/material.dart';

import '../../../domain/model/payment_method.dart';
import '../../../utils/formatters.dart';

class PaymentSelector extends StatelessWidget {
  const PaymentSelector({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final PaymentMethod value;
  final ValueChanged<PaymentMethod> onChanged;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<PaymentMethod>(
      segments: [
        ButtonSegment(
          value: PaymentMethod.card,
          icon: const Icon(Icons.credit_card),
          label: Text(paymentTitle(PaymentMethod.card)),
        ),
        ButtonSegment(
          value: PaymentMethod.cash,
          icon: const Icon(Icons.payments_outlined),
          label: Text(paymentTitle(PaymentMethod.cash)),
        ),
      ],
      selected: {value},
      onSelectionChanged: (selected) => onChanged(selected.single),
    );
  }
}
