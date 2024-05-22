import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meerkat/provider/filter_news_chips.dart';
import 'package:meerkat/widget/news_list.dart';
import 'package:meerkat/widget/filter_news_chips.dart' as filter_widget;

class NewsScreen extends ConsumerWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topic = ref.watch(filterNewsChipsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 64,
            child: filter_widget.FilterNewsChips(),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: topic == "All"
                ? const RecommendedNewsList(orientationVertical: true)
                : RecommendedNewsList(
                    tickers: [topic].lock,
                    orientationVertical: true,
                  ),
          ),
        ]),
      ),
    );
  }
}
