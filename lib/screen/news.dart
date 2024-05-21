import 'package:flutter/material.dart';
import 'package:meerkat/widget/news_list.dart';
import 'package:meerkat/widget/filter_news_chips.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(
                height: 64,
                child: FilterNewsChips(),
              ),
              SizedBox(height: 16),
              Expanded(
                child: RecommendedNewsList(orientationVertical: true),
              ),
            ]),
      ),
    );
  }
}
