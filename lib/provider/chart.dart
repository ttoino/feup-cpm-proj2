import 'package:collection/collection.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:meerkat/model/chart.dart';
import 'package:meerkat/model/company.dart';
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
  IList<Company> companies,
) async {
  final state = ref.watch(chartProvider);

  final interval = switch (state.interval) {
    ChartInterval.day => '1min',
    ChartInterval.week => '15min',
    ChartInterval.month => '60min',
    _ => '1day',
  };

  final series = IMap.fromIterables(
    companies,
    await Future.wait(companies.map((company) async {
      final series =
          (await ref.watch(timeSeriesProvider(company.ticker, interval).future))
              .values
              .sortedBy((element) => element.datetime);

      final today = series.last.datetime.copyWith(
          hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);
      final earliest = switch (state.interval) {
        ChartInterval.day => today,
        ChartInterval.week => today.subtract(const Duration(days: 7)),
        ChartInterval.month => today.subtract(const Duration(days: 30)),
        ChartInterval.sixMonth => today.subtract(const Duration(days: 180)),
        ChartInterval.year => today.subtract(const Duration(days: 365)),
        ChartInterval.fiveYear => today.subtract(const Duration(days: 1825)),
        ChartInterval.all => DateTime.fromMicrosecondsSinceEpoch(0),
      };

      return IMap.fromValues(
        keyMapper: (e) => e.datetime,
        values: series.whereNot((e) => e.datetime.isBefore(earliest)),
      );
    })),
  );

  return ChartData(
    type: state.type,
    interval: state.interval,
    series: series,
  );
}
