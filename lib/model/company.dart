import 'package:freezed_annotation/freezed_annotation.dart';

part 'company.freezed.dart';

@freezed
class Company with _$Company {
  const factory Company({
    required String name,
    required String ticker,
    required String logoUrl,
    required double stockPrice,
  }) = _Company;
}
