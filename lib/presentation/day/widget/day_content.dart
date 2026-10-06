import 'package:flutter/material.dart';

import '../../../domain/model/day_report.dart';
import 'empty_trips.dart';
import 'summary_card.dart';
import 'trip_tile.dart';

class DayContent extends StatelessWidget {
  const DayContent({super.key, required this.report, required this.onRefresh});

  final DayReport report;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 96),
        children: [
          SummaryCard(summary: report.summary),
          const SizedBox(height: 20),
          Text('Поездки', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          if (report.trips.isEmpty)
            const EmptyTrips()
          else
            Card(
              margin: EdgeInsets.zero,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  for (final (index, trip) in report.trips.indexed) ...[
                    if (index > 0) const Divider(height: 1, indent: 72),
                    TripTile(trip: trip),
                  ],
                ],
              ),
            ),
        ],
      ),
    );
  }
}
