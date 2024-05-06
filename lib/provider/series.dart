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
