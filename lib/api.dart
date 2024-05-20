import 'package:dio/dio.dart';
import 'package:meerkat/model/news.dart';
import 'package:meerkat/model/quote.dart';
import 'package:meerkat/model/series.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: 'https://www.alphavantage.co/query')
abstract class AlphaVantageApi {
  factory AlphaVantageApi(Dio dio, {String baseUrl}) = _AlphaVantageApi;

  @GET('')
  Future<DailyTimeSeriesResponse> dailyTimeSeries({
    @Query('symbol') required String symbol,
    @Query('apikey') required String apiKey,
    @Query('outputsize') String outputSize = 'full',
    @Query('function') String function = 'TIME_SERIES_DAILY',
  });

  @GET('')
  Future<IntradayTimeSeriesResponse> intradayTimeSeries({
    @Query('symbol') required String symbol,
    @Query('apikey') required String apiKey,
    @Query('interval') required String interval,
    @Query('outputsize') String outputSize = 'full',
    @Query('function') String function = 'TIME_SERIES_INTRADAY',
  });

  @GET('')
  Future<GlobalQuoteResponse> globalQuote({
    @Query('symbol') required String symbol,
    @Query('apikey') required String apiKey,
    @Query('function') String function = 'GLOBAL_QUOTE',
  });

  @GET('')
  Future<DailyTimeSeriesResponse> symbolSearch({
    @Query('keywords') required String keywords,
    @Query('apikey') required String apiKey,
    @Query('function') String function = 'SYMBOL_SEARCH',
  });

  @GET('')
  Future<NewsSentimentResponse> newsSentiment({
    @Query('tickers') required String tickers,
    @Query('topics') required String topics,
    @Query('apikey') required String apiKey,
    @Query('function') String function = 'NEWS_SENTIMENT',
  });
}
