import 'package:meerkat/model/company.dart';
import 'package:meerkat/provider/company.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search.g.dart';

@riverpod
List<Company> search(SearchRef ref, String query) {
  final companies = ref.watch(companiesProvider);
  return companies
      .where((company) =>
          company.name.toLowerCase().contains(query.toLowerCase()) ||
          company.ticker.toLowerCase().contains(query.toLowerCase()))
      .toList();
}
