import 'package:flutter/material.dart';
import 'package:meerkat/widget/news.dart';
import 'package:meerkat/widget/news_list.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: RecommendedNewsList(orientationVertical: true,),

        ),
      ),
    );
  }
}
