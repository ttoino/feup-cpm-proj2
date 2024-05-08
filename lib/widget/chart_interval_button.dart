import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meerkat/model/chart.dart';
import 'package:meerkat/provider/chart.dart';

class ChartIntervalButton extends ConsumerWidget {
  const ChartIntervalButton({super.key});

  String _label(ChartInterval chartInterval) => switch (chartInterval) {
        ChartInterval.day => 'Today',
        ChartInterval.week => 'Past week',
        ChartInterval.month => 'Past month',
        ChartInterval.sixMonth => 'Past six months',
        ChartInterval.year => 'Past year',
        ChartInterval.fiveYear => 'Past five years',
        ChartInterval.all => 'All time',
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedInterval = ref.watch(chartProvider).interval;

    return MenuAnchor(
      menuChildren: ChartInterval.values
          .map(
            (interval) => MenuItemButton(
              onPressed: () {
                ref.read(chartProvider.notifier).setInterval(interval);
              },
              trailingIcon:
                  interval == selectedInterval ? const Icon(Icons.check) : null,
              child: Text(_label(interval)),
            ),
          )
          .toList(),
      builder: (context, controller, child) => IconButton(
        onPressed: () {
          controller.isOpen ? controller.close() : controller.open();
        },
        icon: const Icon(Icons.event),
      ),
    );
  }
}
