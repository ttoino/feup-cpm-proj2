import 'dart:math';

import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:meerkat/model/series.dart';

class SeriesChart extends StatelessWidget {
  final Map<DateTime, TimeSeries> series;

  const SeriesChart(this.series, {super.key});

  @override
  Widget build(BuildContext context) => Expanded(
        child: BarChart(
          BarChartData(
            barGroups: series.entries
                .sortedBy((e) => e.key)
                .map(
                  (e) => BarChartGroupData(
                    x: e.key.millisecondsSinceEpoch,
                    barRods: [
                      BarChartRodData(
                        fromY: e.value.low,
                        toY: e.value.high,
                        width: 2,
                        color: e.value.open > e.value.close
                            ? Theme.of(context).colorScheme.error
                            : Theme.of(context).colorScheme.primary,
                      ),
                      BarChartRodData(
                        fromY: min(e.value.open, e.value.close),
                        toY: max(e.value.open, e.value.close),
                        color: e.value.open > e.value.close
                            ? Theme.of(context).colorScheme.error
                            : Theme.of(context).colorScheme.primary,
                      )
                    ],
                    barsSpace: -5,
                  ),
                )
                // .skip(90)
                .toList(),
            titlesData: FlTitlesData(
              rightTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1000 * 60 * 60 * 24 * 30,
                  getTitlesWidget: (value, meta) => Text(
                    DateTime.fromMillisecondsSinceEpoch(value.toInt())
                        .toIso8601String()
                        .substring(0, 10),
                  ),
                ),
              ),
            ),
            gridData: const FlGridData(
              verticalInterval: 1000 * 60 * 60 * 24,
              horizontalInterval: 1,
            ),
            groupsSpace: 2,
            alignment: BarChartAlignment.spaceAround,
          ),
        ),
      );
}
