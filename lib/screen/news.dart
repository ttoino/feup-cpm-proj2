import 'package:flutter/material.dart';
import 'package:meerkat/widget/news.dart';

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
          child: NewsFullWidget(
            imageUrl:
                'https://images.pexels.com/photos/35537/child-children-girl-happy.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500',
            title: 'Title',
            description: 'Description',
          ),
        ),
      ),
    );
  }
}
