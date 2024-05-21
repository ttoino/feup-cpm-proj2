import 'package:dio/dio.dart';
import 'package:meerkat/model/quote.dart';
import 'package:meerkat/model/series.dart';
import 'package:retrofit/retrofit.dart';

part 'twelve_data.g.dart';

@RestApi(baseUrl: 'https://api.twelvedata.com')
abstract class TwelveDataApi {
  factory TwelveDataApi(Dio dio, {String baseUrl}) = _TwelveDataApi;

  @GET('/time_series')
  Future<TimeSeriesResponse> timeSeries({
    @Query('symbol') required String symbol,
    @Query('interval') required String interval,
    @Query('apikey') required String apiKey,
    @Query('outputsize') String outputsize = '5000',
  });

  @GET('/quote')
  Future<Quote> quote({
    @Query('symbol') required String symbol,
    @Query('apikey') required String apiKey,
  });
}
