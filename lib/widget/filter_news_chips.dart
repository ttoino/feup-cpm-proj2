import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meerkat/model/news.dart';
import 'package:meerkat/provider/company.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FilterNewsChips extends ConsumerWidget {
  const FilterNewsChips();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final companies = ref.watch(companiesProvider);

    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(width: 8),
      scrollDirection: Axis.horizontal,
      itemCount: companies.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Container(
            margin: EdgeInsets.all(2.0),
            child: GestureDetector(
              onTap: () {
                //Call a function to update your UI
              },
              child: Chip(
                label: Text("All"),
              ),
            ),
          );
        } else {
          return Container(
            margin: EdgeInsets.all(2.0),
            child: GestureDetector(
              onTap: () {
                //Call a function to update your UI
              },
              child: Chip(label: Text(companies[index - 1].name)),
            ),
          );
        }
      },
    );
  }
}
