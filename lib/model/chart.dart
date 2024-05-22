import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meerkat/model/company.dart';
import 'package:meerkat/model/series.dart';

part 'chart.freezed.dart';

enum ChartType {
  candle,
  mountain,
}

enum ChartInterval {
  day,
  week,
  month,
  sixMonth,
  year,
  fiveYear,
  all,
}

@freezed
class ChartState with _$ChartState {
  const factory ChartState({
    required ChartType type,
    required ChartInterval interval,
  }) = _ChartState;
}

@freezed
class ChartData with _$ChartData {
  const factory ChartData({
    required ChartType type,
    required ChartInterval interval,
    required IMap<Company, IMap<DateTime, TimeSeries>> series,
  }) = _ChartData;
}
