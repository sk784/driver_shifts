import 'package:flutter/material.dart';

import '../../../utils/formatters.dart';

class DaySwitcher extends StatelessWidget {
  const DaySwitcher({
    super.key,
    required this.date,
    required this.onTapPrevious,
    required this.onTapNext,
    required this.onChangedDate,
  });

  final DateTime date;
  final VoidCallback onTapPrevious;
  final VoidCallback onTapNext;
  final ValueChanged<DateTime> onChangedDate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Row(
        children: [
          IconButton(
            tooltip: 'Предыдущий день',
            onPressed: onTapPrevious,
            icon: const Icon(Icons.chevron_left),
          ),
          Expanded(
            child: TextButton.icon(
              onPressed: () => _pickDate(context),
              icon: const Icon(Icons.calendar_today_outlined, size: 18),
              label: Text(
                formatDayTitle(date),
                style: theme.textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          IconButton(
            tooltip: 'Следующий день',
            onPressed: onTapNext,
            icon: const Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }

  Future<void> _pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) onChangedDate(picked);
  }
}
