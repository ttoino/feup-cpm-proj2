import 'package:collection/collection.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:meerkat/model/chart.dart';
import 'package:meerkat/provider/series.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chart.g.dart';

@riverpod
class Chart extends _$Chart {
  @override
  ChartState build() => const ChartState(
        type: ChartType.candle,
        interval: ChartInterval.day,
      );

  void setType(ChartType type) {
    state = state.copyWith(type: type);
  }

  void setInterval(ChartInterval interval) {
    state = state.copyWith(interval: interval);
  }
}

@riverpod
Future<ChartData> chartData(
  ChartDataRef ref,
  String symbol,
) async {
  final state = ref.watch(chartProvider);

  var series = switch (state.interval) {
    ChartInterval.day =>
      (await ref.watch(intradayTimeSeriesProvider(symbol, '1min').future))
          .timeSeries,
    ChartInterval.week =>
      (await ref.watch(intradayTimeSeriesProvider(symbol, '15min').future))
          .timeSeries,
    ChartInterval.month =>
      (await ref.watch(intradayTimeSeriesProvider(symbol, '60min').future))
          .timeSeries,
    _ => (await ref.watch(dailyTimeSeriesProvider(symbol).future)).timeSeries,
  }
      .entries
      .sortedBy((element) => element.key);

  final today = series.last.key
      .copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);
  final earliest = switch (state.interval) {
    ChartInterval.day => today,
    ChartInterval.week => today.subtract(const Duration(days: 7)),
    ChartInterval.month => today.subtract(const Duration(days: 30)),
    ChartInterval.sixMonth => today.subtract(const Duration(days: 180)),
    ChartInterval.year => today.subtract(const Duration(days: 365)),
    ChartInterval.fiveYear => today.subtract(const Duration(days: 1825)),
    ChartInterval.all => DateTime.fromMicrosecondsSinceEpoch(0),
  };

  return ChartData(
    type: state.type,
    interval: state.interval,
    series: IMap.fromEntries(
      series.whereNot((e) => e.key.isBefore(earliest)),
    ),
  );
}
