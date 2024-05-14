import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {

  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
/*
          child: ConsumerChart(symbol),
*/
        ),
      ),
    );
  }
}
