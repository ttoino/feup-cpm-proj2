import 'package:meerkat/env.dart';
import 'package:meerkat/model/news.dart';
import 'package:meerkat/provider/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news.g.dart';

@riverpod
Future<NewsSentimentResponse> news(NewsRef ref) async {
  final api = ref.watch(apiProvider);

  return await api.newsSentiment(
    apiKey: Env.apiKey,
  );
}
