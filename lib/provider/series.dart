import 'package:meerkat/env.dart';
import 'package:meerkat/model/series.dart';
import 'package:meerkat/provider/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'series.g.dart';

@riverpod
Future<TimeSeriesResponse> timeSeries(
  TimeSeriesRef ref,
  String symbol,
  String interval,
) async {
  final api = ref.watch(twelveDataProvider);

  return await api.timeSeries(
    apiKey: Env.twelveDataKey,
    symbol: symbol,
    interval: interval,
  );
}
