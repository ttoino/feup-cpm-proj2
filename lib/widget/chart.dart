import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meerkat/model/chart.dart';
import 'package:meerkat/provider/chart.dart';

class Chart extends StatelessWidget {
  final ChartData data;

  const Chart(this.data, {super.key});

  Widget _buildCandleChart(
    BuildContext context,
    final FlTitlesData titlesData,
    final FlGridData gridData,
    final FlBorderData borderData,
  ) {
    final barGroups = data.series.entries.map(
      (e) {
        final open = e.value.open;
        final close = e.value.close;
        final low = e.value.low;
        final high = e.value.high;
        final color = open > close
            ? Theme.of(context).colorScheme.error
            : Theme.of(context).colorScheme.primary;

        return BarChartGroupData(
          x: e.key.millisecondsSinceEpoch,
          barRods: [
            BarChartRodData(
              fromY: low,
              toY: high,
              width: 2,
              color: color,
            ),
            BarChartRodData(
              fromY: min(open, close),
              toY: max(open, close),
              color: color,
            )
          ],
          barsSpace: -5,
        );
      },
    ).toList();

    return BarChart(
      BarChartData(
        barGroups: barGroups,
        titlesData: titlesData,
        gridData: gridData,
        borderData: borderData,
        groupsSpace: 2,
        alignment: BarChartAlignment.spaceAround,
      ),
    );
  }

  Widget _buildMountainChart(
    BuildContext context,
    final FlTitlesData titlesData,
    final FlGridData gridData,
    final FlBorderData borderData,
  ) {
    final lineBarData = LineChartBarData(
      spots: data.series.entries
          .map((e) =>
              FlSpot(e.key.millisecondsSinceEpoch.toDouble(), e.value.close))
          .toList(),
      dotData: const FlDotData(show: false),
      color: Theme.of(context).colorScheme.primary,
      isStrokeCapRound: true,
      isStrokeJoinRound: true,
      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.7),
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
          ],
        ),
        // color: Theme.of(context).colorScheme.primaryContainer,
      ),
    );

    return LineChart(LineChartData(
      lineBarsData: [lineBarData],
      titlesData: titlesData,
      gridData: gridData,
      borderData: borderData,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final titlesData = FlTitlesData(
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 1000 * 60 * 60,
          getTitlesWidget: (value, meta) => Text(
            DateTime.fromMillisecondsSinceEpoch(value.toInt())
                .toIso8601String()
                .substring(0, 10),
          ),
        ),
      ),
    );
    const gridData = FlGridData(
      verticalInterval: 1000 * 60 * 60,
      // horizontalInterval: 1,
    );
    final borderSide = BorderSide(color: Theme.of(context).colorScheme.outline);
    final borderData =
        FlBorderData(border: Border(left: borderSide, bottom: borderSide));

    return Expanded(
        child: switch (data.type) {
      ChartType.candle =>
        _buildCandleChart(context, titlesData, gridData, borderData),
      ChartType.mountain =>
        _buildMountainChart(context, titlesData, gridData, borderData),
    });
  }
}

class ConsumerChart extends ConsumerWidget {
  final String symbol;

  const ConsumerChart(this.symbol, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(chartDataProvider(symbol));

    return data.map(
      data: (data) => Chart(data.value),
      error: (error) => Text(error.error.toString()),
      loading: (_) => const Expanded(child: CircularProgressIndicator()),
    );
  }
}
