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
