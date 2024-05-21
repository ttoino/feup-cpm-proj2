import 'package:dio/dio.dart';
import 'package:meerkat/model/news.dart';
import 'package:retrofit/retrofit.dart';

part 'alpha_vantage.g.dart';

@RestApi(baseUrl: 'https://www.alphavantage.co/query')
abstract class AlphaVantageApi {
  factory AlphaVantageApi(Dio dio, {String baseUrl}) = _AlphaVantageApi;

  @GET('')
  Future<NewsSentimentResponse> newsSentiment({
    @Query('tickers') required String tickers,
    @Query('topics') required String topics,
    @Query('apikey') required String apiKey,
    @Query('function') String function = 'NEWS_SENTIMENT',
  });
}
