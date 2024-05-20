import 'package:freezed_annotation/freezed_annotation.dart';

part 'news.freezed.dart';
part 'news.g.dart';

@freezed
class News with _$News {
  const factory News({
    required String title,
    required String url,
    @JsonKey(name: 'time_published') required DateTime timePublished,
    required List<String> authors,
    required String summary,
    @JsonKey(name: 'banner_image') String? bannerImage,
    required String source,
    @JsonKey(name: 'ticker_sentiment')
    required List<TickerSentiment> tickerSentiment,
  }) = _News;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}

@freezed
class TickerSentiment with _$TickerSentiment {
  const factory TickerSentiment({
    required String ticker,
    @JsonKey(name: 'relevance_score', fromJson: double.parse)
    required double relevanceScore,
    @JsonKey(name: 'ticker_sentiment_score', fromJson: double.parse)
    required double tickerSentimentScore,
    @JsonKey(name: 'ticker_sentiment_label')
    required String tickerSentimentLabel,
  }) = _TickerSentiment;

  factory TickerSentiment.fromJson(Map<String, dynamic> json) =>
      _$TickerSentimentFromJson(json);
}

@freezed
class NewsSentimentResponse with _$NewsSentimentResponse {
  const factory NewsSentimentResponse({
    @JsonKey(fromJson: int.parse) required int items,
    required List<News> feed,
  }) = _NewsSentimentResponse;

  factory NewsSentimentResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsSentimentResponseFromJson(json);
}
