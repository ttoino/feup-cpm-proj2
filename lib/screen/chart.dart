import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:meerkat/model/company.dart';
import 'package:meerkat/widget/chart.dart';
import 'package:meerkat/widget/chart_interval_button.dart';
import 'package:meerkat/widget/chart_type_button.dart';
import 'package:meerkat/widget/news_list.dart';
import 'package:meerkat/widget/quote.dart';

class ChartScreen extends StatelessWidget {
  final Company company;

  const ChartScreen(this.company, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(company.name),
        actions: const [ChartTypeButton(), ChartIntervalButton()],
      ),
      body: CustomScrollView(
        primary: true,
        slivers: [
          SliverFillViewport(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  height: 1000,
                  child: ConsumerChart([company].lock),
                ),
              ),
            ]),
          ),
          SliverList.list(children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: QuoteInfo(company.ticker),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Related news",
                style: Theme.of(context).typography.englishLike.titleLarge,
              ),
            ),
            RecommendedNewsList(
              tickers: [company.ticker].lock,
              limit: 3,
            )
          ]),
        ],
      ),
    );
  }
}
