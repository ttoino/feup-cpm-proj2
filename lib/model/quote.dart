import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote.freezed.dart';
part 'quote.g.dart';

@freezed
class Quote with _$Quote {
  const factory Quote({
    required String symbol,
    required String name,
    required String exchange,
    @JsonKey(name: 'mic_code') required String micCode,
    required String currency,
    required DateTime datetime,
    required int timestamp,
    @JsonKey(fromJson: double.parse) required double open,
    @JsonKey(fromJson: double.parse) required double high,
    @JsonKey(fromJson: double.parse) required double low,
    @JsonKey(fromJson: double.parse) required double close,
    @JsonKey(fromJson: int.parse) required int volume,
    @JsonKey(name: 'previous_close', fromJson: double.parse)
    required double previousClose,
    @JsonKey(fromJson: double.parse) required double change,
    @JsonKey(name: 'percent_change', fromJson: double.parse)
    required double percentChange,
    @JsonKey(name: 'average_volume', fromJson: int.parse)
    required int averageVolume,
    @JsonKey(name: 'is_market_open') required bool isMarketOpen,
    @JsonKey(name: 'fifty_two_week') required FiftyTwoWeek fiftyTwoWeek,
  }) = _Quote;

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);
}

@freezed
class FiftyTwoWeek with _$FiftyTwoWeek {
  const factory FiftyTwoWeek({
    @JsonKey(fromJson: double.parse) required double low,
    @JsonKey(fromJson: double.parse) required double high,
    @JsonKey(name: 'low_change', fromJson: double.parse)
    required double lowChange,
    @JsonKey(name: 'high_change', fromJson: double.parse)
    required double highChange,
    @JsonKey(name: 'low_change_percent', fromJson: double.parse)
    required double lowChangePercent,
    @JsonKey(name: 'high_change_percent', fromJson: double.parse)
    required double highChangePercent,
  }) = _FiftyTwoWeek;

  factory FiftyTwoWeek.fromJson(Map<String, dynamic> json) =>
      _$FiftyTwoWeekFromJson(json);
}
