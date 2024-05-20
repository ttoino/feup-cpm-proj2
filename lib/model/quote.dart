import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote.freezed.dart';
part 'quote.g.dart';

@freezed
class Quote with _$Quote {
  const factory Quote({
    @JsonKey(name: '01. symbol') required String symbol,
    @JsonKey(name: '02. open', fromJson: double.parse) required double open,
    @JsonKey(name: '03. high', fromJson: double.parse) required double high,
    @JsonKey(name: '04. low', fromJson: double.parse) required double low,
    @JsonKey(name: '05. price', fromJson: double.parse) required double price,
    @JsonKey(name: '06. volume', fromJson: int.parse) required int volume,
    @JsonKey(name: '07. latest trading day', fromJson: DateTime.parse)
    required DateTime latestTradingDay,
    @JsonKey(name: '08. previous close', fromJson: double.parse)
    required double previousClose,
    @JsonKey(name: '09. change', fromJson: double.parse) required double change,
    @JsonKey(name: '10. change percent', fromJson: _parsePercentage)
    required double changePercent,
  }) = _Quote;

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);
}

@freezed
class GlobalQuoteResponse with _$GlobalQuoteResponse {
  const factory GlobalQuoteResponse({
    @JsonKey(name: 'Global Quote') required Quote globalQuote,
  }) = _GlobalQuoteResponse;

  factory GlobalQuoteResponse.fromJson(Map<String, dynamic> json) =>
      _$GlobalQuoteResponseFromJson(json);
}

double _parsePercentage(String s) => double.parse(s.replaceAll('%', ''));
