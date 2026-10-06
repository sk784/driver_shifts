import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injectable/injectable.dart';
import '../../utils/formatters.dart';
import 'add_trip_cubit.dart';
import 'add_trip_field.dart';
import 'add_trip_state.dart';
import 'widget/payment_selector.dart';
import 'widget/time_field.dart';

/// Шторка добавления поездки в выбранный день.
/// Возвращает `true`, если поездка сохранена.
class AddTripSheet extends StatelessWidget {
  const AddTripSheet({super.key});

  static Future<bool?> show(BuildContext context, DateTime date) =>
      showModalBottomSheet<bool>(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        builder: (_) => BlocProvider(
          create: (_) => getIt<AddTripCubit>(param1: date),
          child: const AddTripSheet(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddTripCubit>();
    final theme = Theme.of(context);
    return BlocConsumer<AddTripCubit, AddTripState>(
      listenWhen: (previous, current) => !previous.isSaved && current.isSaved,
      listener: (context, _) => Navigator.of(context).pop(true),
      builder: (context, state) {
        final errors = state.fieldErrors;
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.viewInsetsOf(context).bottom,
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Новая поездка', style: theme.textTheme.titleLarge),
                Text(
                  formatDayTitle(state.date),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TimeField(
                        label: 'Начало',
                        value: state.start,
                        errorText: errors[AddTripField.start],
                        onChanged: cubit.changeStart,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TimeField(
                        label: 'Окончание',
                        value: state.end,
                        errorText: errors[AddTripField.end],
                        onChanged: cubit.changeEnd,
                      ),
                    ),
                  ],
                ),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Закончилась после полуночи'),
                  value: state.isEndNextDay,
                  onChanged: cubit.changeEndNextDay,
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Сумма, ₽',
                          border: const OutlineInputBorder(),
                          errorText: errors[AddTripField.amount],
                          errorMaxLines: 2,
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: cubit.changeAmount,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Комиссия, ₽',
                          hintText: '0',
                          border: const OutlineInputBorder(),
                          errorText: errors[AddTripField.commission],
                          errorMaxLines: 2,
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: cubit.changeCommission,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                PaymentSelector(
                  value: state.payment,
                  onChanged: cubit.changePayment,
                ),
                if (state.message case final message?) ...[
                  const SizedBox(height: 16),
                  Text(
                    message,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.error,
                    ),
                  ),
                ],
                const SizedBox(height: 20),
                FilledButton(
                  onPressed: state.isSubmitting ? null : cubit.submit,
                  child: state.isSubmitting
                      ? const SizedBox.square(
                          dimension: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Сохранить'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
