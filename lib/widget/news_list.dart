import 'dart:math';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meerkat/provider/news.dart';
import 'package:meerkat/screen/news.dart';
import 'package:meerkat/widget/news.dart';

class RecommendedNewsList extends ConsumerWidget {
  final IList<String> topics;
  final IList<String> tickers;
  final int? limit;
  final bool orientationVertical;

  const RecommendedNewsList({
    this.topics = const IList.empty(),
    this.tickers = const IList.empty(),
    this.limit,
    this.orientationVertical = false,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final news = ref.watch(newsProvider(
      topics: topics,
      tickers: tickers,
    ));

    final child = news.map(
      data: (data) {
        final count = min(data.value.items, limit ?? data.value.items);

        return ListView.separated(
          padding: orientationVertical
              ? const EdgeInsets.symmetric(horizontal: 0, vertical: 16)
              : const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          scrollDirection:
              orientationVertical ? Axis.vertical : Axis.horizontal,
          itemCount: orientationVertical ? count : count + 1,
          itemBuilder: (context, index) {
            if (index >= count) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NewsScreen()));
                    },
                    child: const Text("See more"),
                  ),
                ),
              );
            }

            final newsItem = data.value.feed[index];
            return NewsCard(
              newsItem,
              key: Key(newsItem.title),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(width: 8),
        );
      },
      error: (error) => Text(error.error.toString()),
      loading: (_) => const Center(child: CircularProgressIndicator()),
    );

    if (orientationVertical) {
      return child;
    } else {
      return SizedBox(
        height: 223.5,
        child: child,
      );
    }
  }
}
