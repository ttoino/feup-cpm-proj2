import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meerkat/provider/company.dart';
import 'package:meerkat/provider/filter_news_chips.dart';

class FilterNewsChips extends ConsumerWidget {
  const FilterNewsChips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final companies = ref.watch(companiesProvider);
    final topic = ref.watch(filterNewsChipsProvider);

    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(width: 8),
      scrollDirection: Axis.horizontal,
      itemCount: companies.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Container(
            margin: const EdgeInsets.all(2.0),
            child: ChoiceChip(
              selected: topic == "All",
              onSelected: (selected) {
                if (selected) {
                  ref.read(filterNewsChipsProvider.notifier).setTopic("All");
                }
              },
              label: const Text("All"),
            ),
          );
        } else {
          return Container(
            margin: const EdgeInsets.all(2.0),
            child: ChoiceChip(
                selected: topic == (companies[index - 1].ticker),
                onSelected: (selected) {
                  if (selected) {
                    ref
                        .read(filterNewsChipsProvider.notifier)
                        .setTopic(companies[index - 1].ticker);
                  }
                },
                label: Text(companies[index - 1].name)),
          );
        }
      },
    );
  }
}
