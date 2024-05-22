import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:meerkat/model/company.dart';
import 'package:meerkat/widget/chart.dart';
import 'package:meerkat/widget/chart_interval_button.dart';

class CompareChartsScreen extends StatelessWidget {
  final List<Company> companies;

  const CompareChartsScreen(this.companies, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: companies
              .map<Widget>(
                (e) => Text(e.ticker),
              )
              .toList()
              .addBetween(
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(Icons.compare_arrows),
                ),
              ),
        ),
        actions: const [ChartIntervalButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ConsumerChart(companies.lock),
      ),
    );
  }
}
