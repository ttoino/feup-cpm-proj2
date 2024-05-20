import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'series.freezed.dart';
part 'series.g.dart';

@freezed
class TimeSeries with _$TimeSeries {
  const factory TimeSeries({
    @JsonKey(name: '1. open', fromJson: double.parse) required double open,
    @JsonKey(name: '2. high', fromJson: double.parse) required double high,
    @JsonKey(name: '3. low', fromJson: double.parse) required double low,
    @JsonKey(name: '4. close', fromJson: double.parse) required double close,
    @JsonKey(name: '5. volume', fromJson: int.parse) required int volume,
  }) = _TimeSeries;

  factory TimeSeries.fromJson(Map<String, dynamic> json) =>
      _$TimeSeriesFromJson(json);
}

@freezed
class DailyTimeSeriesMetaData with _$DailyTimeSeriesMetaData {
  const factory DailyTimeSeriesMetaData({
    @JsonKey(name: '1. Information') required String information,
    @JsonKey(name: '2. Symbol') required String symbol,
    @JsonKey(name: '3. Last Refreshed') required DateTime lastRefreshed,
    @JsonKey(name: '4. Output Size') required String outputSize,
    @JsonKey(name: '5. Time Zone') required String timeZone,
  }) = _DailyTimeSeriesMetaData;

  factory DailyTimeSeriesMetaData.fromJson(Map<String, dynamic> json) =>
      _$DailyTimeSeriesMetaDataFromJson(json);
}

@freezed
class DailyTimeSeriesResponse with _$DailyTimeSeriesResponse {
  const factory DailyTimeSeriesResponse({
    @JsonKey(name: 'Meta Data') required DailyTimeSeriesMetaData metaData,
    @JsonKey(name: 'Time Series (Daily)', fromJson: _timeSeriesFromJson)
    required IMap<DateTime, TimeSeries> timeSeries,
  }) = _DailyTimeSeriesResponse;

  factory DailyTimeSeriesResponse.fromJson(Map<String, dynamic> json) =>
      _$DailyTimeSeriesResponseFromJson(json);
}

@freezed
class IntradayTimeSeriesMetaData with _$IntradayTimeSeriesMetaData {
  const factory IntradayTimeSeriesMetaData({
    @JsonKey(name: '1. Information') required String information,
    @JsonKey(name: '2. Symbol') required String symbol,
    @JsonKey(name: '3. Last Refreshed') required DateTime lastRefreshed,
    @JsonKey(name: '4. Interval') required String interval,
    @JsonKey(name: '5. Output Size') required String outputSize,
    @JsonKey(name: '6. Time Zone') required String timeZone,
  }) = _IntradayTimeSeriesMetaData;

  factory IntradayTimeSeriesMetaData.fromJson(Map<String, dynamic> json) =>
      _$IntradayTimeSeriesMetaDataFromJson(json);
}

@freezed
class IntradayTimeSeriesResponse with _$IntradayTimeSeriesResponse {
  const factory IntradayTimeSeriesResponse({
    @JsonKey(name: 'Meta Data') required IntradayTimeSeriesMetaData metaData,
    @JsonKey(readValue: _readIntradayTimeSeries, fromJson: _timeSeriesFromJson)
    required IMap<DateTime, TimeSeries> timeSeries,
  }) = _IntradayTimeSeriesResponse;

  factory IntradayTimeSeriesResponse.fromJson(Map<String, dynamic> json) =>
      _$IntradayTimeSeriesResponseFromJson(json);
}

dynamic _readIntradayTimeSeries(Map<dynamic, dynamic> json, String name) =>
    json.entries
        .firstWhere((element) =>
            element.key is String && element.key.startsWith('Time Series'))
        .value;

IMap<DateTime, TimeSeries> _timeSeriesFromJson(Map<String, dynamic> json) =>
    IMap.fromJson(json, (v) => v as DateTime,
        (value) => TimeSeries.fromJson(value as Map<String, dynamic>));
