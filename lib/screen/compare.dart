import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meerkat/model/company.dart';
import 'package:meerkat/provider/company.dart';
import 'package:meerkat/screen/compare_chart.dart';

class CompareScreen extends ConsumerStatefulWidget {
  const CompareScreen({super.key});

  @override
  CompareScreenState createState() => CompareScreenState();
}

class CompareScreenState extends ConsumerState<CompareScreen> {
  List<Company> selected = [];

  @override
  Widget build(BuildContext context) {
    final companies = ref.watch(companiesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Compare stocks")),
      floatingActionButton: selected.length >= 2
          ? FloatingActionButton.extended(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CompareChartsScreen(selected),
                ),
              ),
              icon: const Icon(Icons.compare_arrows),
              label: const Text("Compare"),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: companies.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 256,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          final company = companies[index];
          final isSelected = selected.contains(company);
          final disabled = selected.length >= 2 && !isSelected;

          final content = Padding(
            padding: const EdgeInsets.fromLTRB(8, 24, 8, 16),
            child: Column(children: [
              Expanded(
                child: Ink.image(
                  image: NetworkImage(company.logoUrl),
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                company.name,
                style: Theme.of(context).typography.englishLike.bodyLarge,
                maxLines: 1,
                overflow: TextOverflow.fade,
              ),
            ]),
          );

          return AnimatedOpacity(
            opacity: isSelected || selected.length < 2 ? 1 : 0.38,
            duration: const Duration(milliseconds: 200),
            child: Card.filled(
              clipBehavior: Clip.antiAlias,
              color: isSelected
                  ? Theme.of(context).colorScheme.tertiaryContainer
                  : null,
              child: disabled
                  ? content
                  : InkWell(
                      onTap: () => setState(
                        () {
                          if (isSelected) {
                            selected.remove(company);
                          } else if (selected.length < 2) {
                            selected.add(company);
                          }
                        },
                      ),
                      child: content,
                    ),
            ),
          );
        },
      ),
    );
  }
}
