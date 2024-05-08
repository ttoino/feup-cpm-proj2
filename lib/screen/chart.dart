import 'package:flutter/material.dart';
import 'package:meerkat/widget/chart.dart';
import 'package:meerkat/widget/chart_interval_button.dart';
import 'package:meerkat/widget/chart_type_button.dart';

class ChartScreen extends StatelessWidget {
  final String symbol;

  const ChartScreen(this.symbol, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(symbol),
        actions: const [ChartTypeButton(), ChartIntervalButton()],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ConsumerChart(symbol),
        ),
      ),
    );
  }
}
