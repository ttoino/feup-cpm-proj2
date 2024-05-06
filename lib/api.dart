import 'package:dio/dio.dart';
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
    @Query('function') String function = 'TIME_SERIES_DAILY',
  });

  @GET('')
  Future<DailyTimeSeriesResponse> symbolSearch({
    @Query('keywords') required String keywords,
    @Query('apikey') required String apiKey,
    @Query('function') String function = 'SYMBOL_SEARCH',
  });
}
