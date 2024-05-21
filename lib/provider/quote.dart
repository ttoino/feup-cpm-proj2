import 'package:meerkat/env.dart';
import 'package:meerkat/model/quote.dart';
import 'package:meerkat/provider/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quote.g.dart';

@riverpod
Future<Quote> quote(
  QuoteRef ref,
  String symbol,
) async {
  final api = ref.watch(twelveDataProvider);

  return await api.quote(
    apiKey: Env.twelveDataKey,
    symbol: symbol,
  );
}
