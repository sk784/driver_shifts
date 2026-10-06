import 'package:flutter/material.dart';

/// Поле выбора времени: по нажатию открывает системный пикер.
class TimeField extends StatelessWidget {
  const TimeField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.errorText,
  });

  final String label;
  final TimeOfDay? value;
  final String? errorText;
  final ValueChanged<TimeOfDay> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: () => _pick(context),
      child: InputDecorator(
        isEmpty: value == null,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          suffixIcon: const Icon(Icons.schedule),
          errorText: errorText,
          errorMaxLines: 2,
        ),
        child: Text(value?.format(context) ?? ''),
      ),
    );
  }

  Future<void> _pick(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: value ?? TimeOfDay.now(),
    );
    if (picked != null) onChanged(picked);
  }
}
