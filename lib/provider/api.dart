import 'package:dio/dio.dart';
import 'package:meerkat/api/alpha_vantage.dart';
import 'package:meerkat/api/twelve_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api.g.dart';

@riverpod
Dio dio(DioRef ref) => Dio();

@riverpod
AlphaVantageApi alphaVantage(AlphaVantageRef ref) =>
    AlphaVantageApi(ref.watch(dioProvider));

@riverpod
TwelveDataApi twelveData(TwelveDataRef ref) =>
    TwelveDataApi(ref.watch(dioProvider));
