import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:meerkat/env.dart';
import 'package:meerkat/model/news.dart';
import 'package:meerkat/provider/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news.g.dart';

@riverpod
Future<NewsSentimentResponse> news(
  NewsRef ref, {
  IList<String> topics = const IList.empty(),
  IList<String> tickers = const IList.empty(),
}) async {
  final api = ref.watch(apiProvider);

  return await api.newsSentiment(
    apiKey: Env.apiKey,
    topics: topics.join(','),
    tickers: tickers.join(','),
  );
}
