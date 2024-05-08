import 'package:meerkat/env.dart';
import 'package:meerkat/model/series.dart';
import 'package:meerkat/provider/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'series.g.dart';

@riverpod
Future<DailyTimeSeriesResponse> dailyTimeSeries(
  DailyTimeSeriesRef ref,
  String symbol,
) async {
  final api = ref.watch(apiProvider);

  return await api.dailyTimeSeries(
    apiKey: Env.apiKey,
    symbol: symbol,
  );
}

@riverpod
Future<IntradayTimeSeriesResponse> intradayTimeSeries(
  IntradayTimeSeriesRef ref,
  String symbol,
  String interval,
) async {
  final api = ref.watch(apiProvider);

  return await api.intradayTimeSeries(
    apiKey: Env.apiKey,
    symbol: symbol,
    interval: interval,
  );
}
