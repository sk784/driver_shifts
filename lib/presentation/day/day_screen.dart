import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injectable/injectable.dart';
import '../add_trip/add_trip_sheet.dart';
import 'day_cubit.dart';
import 'day_state.dart';
import 'widget/day_content.dart';
import 'widget/day_switcher.dart';
import 'widget/error_view.dart';

class DayScreen extends StatelessWidget {
  const DayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<DayCubit>(),
      child: const _DayView(),
    );
  }
}

class _DayView extends StatelessWidget {
  const _DayView();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DayCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text('Дневник смен')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _addTrip(context),
        icon: const Icon(Icons.add),
        label: const Text('Поездка'),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: BlocBuilder<DayCubit, DayState>(
              builder: (context, state) => Column(
                children: [
                  DaySwitcher(
                    date: state.date,
                    onTapPrevious: cubit.previousDay,
                    onTapNext: cubit.nextDay,
                    onChangedDate: cubit.selectDay,
                  ),
                  Expanded(
                    child: switch (state) {
                      DayLoading() => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      DayFailure(:final message) => ErrorView(
                        message: message,
                        onTapRetry: cubit.retry,
                      ),
                      DaySuccess(:final report) => DayContent(
                        report: report,
                        onRefresh: cubit.refresh,
                      ),
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _addTrip(BuildContext context) async {
    final cubit = context.read<DayCubit>();
    final isSaved = await AddTripSheet.show(context, cubit.state.date);
    if (isSaved == true) await cubit.refresh();
  }
}
