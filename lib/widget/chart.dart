import 'dart:math';

import 'package:collection/collection.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meerkat/model/chart.dart';
import 'package:meerkat/model/company.dart';
import 'package:meerkat/model/series.dart';
import 'package:meerkat/provider/chart.dart';

class Chart extends StatelessWidget {
  final ChartData data;

  const Chart(this.data, {super.key});

  Widget _buildCandleChart(
    BuildContext context,
    final IMap<DateTime, TimeSeries> series,
    final AppLocalizations l10n,
    final FlTitlesData titlesData,
    final FlGridData gridData,
    final FlBorderData borderData,
  ) {
    final barGroups = series.values.mapIndexed(
      (i, v) {
        final open = v.open;
        final close = v.close;
        final low = v.low;
        final high = v.high;
        final color = open > close
            ? Theme.of(context).colorScheme.error
            : Theme.of(context).colorScheme.primary;

        return BarChartGroupData(
          x: i,
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
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            tooltipRoundedRadius: 4,
            tooltipPadding: const EdgeInsets.all(8),
            fitInsideHorizontally: true,
            fitInsideVertically: true,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              final date = _dateFromX(group.x);
              final s = series[date]!;
              return BarTooltipItem(
                l10n.chartDetail(
                    date, date, s.open, s.close, s.high, s.low, s.volume),
                Theme.of(context).typography.englishLike.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onInverseSurface),
              );
            },
            getTooltipColor: (bar) =>
                Theme.of(context).colorScheme.inverseSurface,
          ),
        ),
        titlesData: titlesData,
        gridData: gridData,
        borderData: borderData,
        groupsSpace: 2,
        alignment: BarChartAlignment.spaceAround,
      ),
    );
  }

  Widget _buildLineChart(
    BuildContext context,
    final IMap<Company, IMap<DateTime, TimeSeries>> series,
    final AppLocalizations l10n,
    final FlTitlesData titlesData,
    final FlGridData gridData,
    final FlBorderData borderData,
  ) {
    final mountain = series.length <= 1;
    var index = 0;
    final lineBarsData = series.mapTo(
      (company, series) {
        final r = LineChartBarData(
          spots: series.values
              .mapIndexed((i, v) => FlSpot(i.toDouble(), v.close))
              .toList(),
          dotData: const FlDotData(show: false),
          color: index.isEven
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.error,
          isStrokeCapRound: true,
          isStrokeJoinRound: true,
          belowBarData: BarAreaData(
            show: mountain,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.primary.withOpacity(0.7),
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
              ],
            ),
          ),
        );
        index++;
        return r;
      },
    );

    return LineChart(LineChartData(
      lineBarsData: lineBarsData.toList(),
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipRoundedRadius: 4,
          tooltipPadding: const EdgeInsets.all(8),
          fitInsideHorizontally: true,
          fitInsideVertically: true,
          getTooltipItems: (spots) => spots.map((e) {
            final date = _dateFromX(e.x);
            final s =
                series.values.firstWhere((s) => s[date]?.close == e.y)[date]!;
            return LineTooltipItem(
              l10n.chartDetail(
                  date, date, s.open, s.close, s.high, s.low, s.volume),
              Theme.of(context).typography.englishLike.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onInverseSurface),
            );
          }).toList(),
          getTooltipColor: (spot) =>
              Theme.of(context).colorScheme.inverseSurface,
        ),
        getTouchedSpotIndicator: (barData, spotIndexes) => spotIndexes
            .map(
              (spotIndex) => TouchedSpotIndicatorData(
                FlLine(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  strokeWidth: 2,
                ),
                FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, barData, index) =>
                      FlDotCirclePainter(
                    radius: 4,
                    color: Theme.of(context).colorScheme.inverseSurface,
                    strokeWidth: 0,
                  ),
                ),
              ),
            )
            .toList(),
      ),
      titlesData: titlesData,
      gridData: gridData,
      borderData: borderData,
    ));
  }

  bool Function(DateTime) _filter() {
    final int Function(DateTime) groupBy = switch (data.interval) {
      ChartInterval.day => (date) => date.hour,
      ChartInterval.week || ChartInterval.month => (date) =>
          date.month * 100 + date.day,
      ChartInterval.sixMonth || ChartInterval.year => (date) =>
          date.year * 100 + date.month,
      ChartInterval.fiveYear || ChartInterval.all => (date) => date.year,
    };
    final grouped = data.series.values.first.keys.groupListsBy(groupBy);

    return (date) => grouped[groupBy(date)]?.first == date;
  }

  String Function(DateTime) _formatDate(final AppLocalizations l10n) =>
      switch (data.interval) {
        ChartInterval.day => l10n.chartDateDay,
        ChartInterval.week => l10n.chartDateWeek,
        ChartInterval.month => l10n.chartDateMonth,
        ChartInterval.sixMonth => l10n.chartDateSixMonth,
        ChartInterval.year => l10n.chartDateYear,
        ChartInterval.fiveYear => l10n.chartDateFiveYear,
        ChartInterval.all => l10n.chartDateAll,
      };

  DateTime _dateFromX(num x) =>
      data.series.values.first.keys.skip(x.toInt()).first;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final format = _formatDate(l10n);
    final filter = _filter();
    final titlesData = FlTitlesData(
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 1,
          filterTitles: (meta) => filter(
              data.series.values.first.keys.skip(meta.axisValue.toInt()).first),
          getTitlesWidget: (value, meta) => SideTitleWidget(
            axisSide: meta.axisSide,
            fitInside: SideTitleFitInsideData.fromTitleMeta(
              meta,
              distanceFromEdge: 0,
            ),
            space: 6,
            angle: pi / 4,
            child: Text(format(_dateFromX(value))),
          ),
        ),
      ),
    );
    const gridData = FlGridData(drawVerticalLine: false);
    final borderSide = BorderSide(color: Theme.of(context).colorScheme.outline);
    final borderData =
        FlBorderData(border: Border(left: borderSide, bottom: borderSide));

    return data.series.length <= 1 && data.type == ChartType.candle
        ? _buildCandleChart(context, data.series.values.first, l10n, titlesData,
            gridData, borderData)
        : _buildLineChart(
            context, data.series, l10n, titlesData, gridData, borderData);
  }
}

class ConsumerChart extends ConsumerWidget {
  final IList<Company> companies;

  const ConsumerChart(this.companies, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(chartDataProvider(companies));

    return data.map(
      data: (data) => Chart(data.value),
      error: (error) => Text(error.error.toString()),
      loading: (_) => const Center(child: CircularProgressIndicator()),
    );
  }
}
