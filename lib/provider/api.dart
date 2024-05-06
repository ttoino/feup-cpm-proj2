import 'package:dio/dio.dart';
import 'package:meerkat/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api.g.dart';

@riverpod
Dio dio(DioRef ref) => Dio();

@riverpod
AlphaVantageApi api(ApiRef ref) => AlphaVantageApi(ref.watch(dioProvider));
