import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meerkat/model/chart.dart';
import 'package:meerkat/provider/chart.dart';

class ChartTypeButton extends ConsumerWidget {
  const ChartTypeButton({super.key});

  IconData _icon(ChartType chartType) => switch (chartType) {
        ChartType.candle => Icons.candlestick_chart,
        ChartType.mountain => Icons.show_chart,
      };

  String _label(ChartType chartType) => switch (chartType) {
        ChartType.candle => 'Candle stick chart',
        ChartType.mountain => 'Mountain chart',
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedType = ref.watch(chartProvider).type;

    return MenuAnchor(
      menuChildren: ChartType.values
          .map(
            (type) => MenuItemButton(
              onPressed: () {
                ref.read(chartProvider.notifier).setType(type);
              },
              trailingIcon:
                  type == selectedType ? const Icon(Icons.check) : null,
              leadingIcon: Icon(_icon(type)),
              child: Text(_label(type)),
            ),
          )
          .toList(),
      builder: (context, controller, child) => IconButton(
        onPressed: () {
          controller.isOpen ? controller.close() : controller.open();
        },
        icon: Icon(_icon(selectedType)),
      ),
    );
  }
}
