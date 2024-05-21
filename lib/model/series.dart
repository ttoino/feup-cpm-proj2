import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'series.freezed.dart';
part 'series.g.dart';

@freezed
class TimeSeries with _$TimeSeries {
  const factory TimeSeries({
    required DateTime datetime,
    @JsonKey(fromJson: double.parse) required double open,
    @JsonKey(fromJson: double.parse) required double high,
    @JsonKey(fromJson: double.parse) required double low,
    @JsonKey(fromJson: double.parse) required double close,
    @JsonKey(fromJson: int.parse) required int volume,
  }) = _TimeSeries;

  factory TimeSeries.fromJson(Map<String, dynamic> json) =>
      _$TimeSeriesFromJson(json);
}

@freezed
class TimeSeriesMetaData with _$TimeSeriesMetaData {
  const factory TimeSeriesMetaData({
    required String symbol,
    required String interval,
    required String currency,
    @JsonKey(name: 'exchange_timezone') required String exchangeTimezone,
    required String exchange,
    @JsonKey(name: 'mic_code') required String micCode,
    required String type,
  }) = _TimeSeriesMetaData;

  factory TimeSeriesMetaData.fromJson(Map<String, dynamic> json) =>
      _$TimeSeriesMetaDataFromJson(json);
}

@freezed
class TimeSeriesResponse with _$TimeSeriesResponse {
  const factory TimeSeriesResponse({
    required TimeSeriesMetaData meta,
    required IList<TimeSeries> values,
  }) = _TimeSeriesResponse;

  factory TimeSeriesResponse.fromJson(Map<String, dynamic> json) =>
      _$TimeSeriesResponseFromJson(json);
}
