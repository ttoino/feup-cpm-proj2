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
  final api = ref.watch(apiProvider);

  return (await api.globalQuote(
    apiKey: Env.apiKey,
    symbol: symbol,
  ))
      .globalQuote;
}
