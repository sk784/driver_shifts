import 'package:flutter/material.dart';

import '../../../domain/model/day_summary.dart';
import '../../../utils/formatters.dart';
import 'payment_split.dart';
import 'summary_stat.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key, required this.summary});

  final DaySummary summary;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('На руки', style: theme.textTheme.labelLarge),
            const SizedBox(height: 4),
            Text(
              formatMoney(summary.net),
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                SummaryStat(
                  title: 'Выручка',
                  value: formatMoney(summary.revenue),
                ),
                SummaryStat(
                  title: 'Комиссия',
                  value: formatMoney(summary.commission),
                ),
                SummaryStat(title: 'Поездок', value: '${summary.tripsCount}'),
              ],
            ),
            if (summary.tripsCount > 0) ...[
              const SizedBox(height: 16),
              PaymentSplit(cash: summary.cash, card: summary.card),
            ],
          ],
        ),
      ),
    );
  }
}
