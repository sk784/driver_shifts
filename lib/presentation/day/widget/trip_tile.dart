import 'package:flutter/material.dart';

import '../../../domain/model/payment_method.dart';
import '../../../domain/model/trip.dart';
import '../../../utils/colors.dart';
import '../../../utils/formatters.dart';

class TripTile extends StatelessWidget {
  const TripTile({super.key, required this.trip});

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = paymentColor(trip.payment);
    final nextDay = trip.isEndsNextDay ? ' (+1 день)' : '';
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withValues(alpha: 0.12),
        foregroundColor: color,
        child: Icon(switch (trip.payment) {
          PaymentMethod.cash => Icons.payments_outlined,
          PaymentMethod.card => Icons.credit_card,
        }, semanticLabel: paymentTitle(trip.payment)),
      ),
      title: Text(
        '${formatClock(trip.start)} – ${formatClock(trip.end)}$nextDay',
      ),
      subtitle: Text(
        '${formatDuration(trip.duration)} · комиссия ${formatMoney(trip.commission)}',
      ),
      trailing: Text(
        formatMoney(trip.amount),
        style: theme.textTheme.titleMedium,
      ),
    );
  }
}
