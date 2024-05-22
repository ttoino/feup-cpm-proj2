import 'package:collection/collection.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:meerkat/model/chart.dart';
import 'package:meerkat/provider/series.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_news_chips.g.dart';

@riverpod
class FilterNewsChips extends _$FilterNewsChips {
  @override
  String build() => "All";

  void setTopic(String topic) {
    state = topic;
  }
}
