import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meerkat/provider/search.dart';
import 'package:meerkat/widget/company.dart';

class MeerkatSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(Icons.clear),
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back),
      );

  @override
  Widget buildResults(BuildContext context) => _SearchResults(query);

  @override
  Widget buildSuggestions(BuildContext context) => _SearchResults(query);

  // List<RecommendedCompany> companies = [
  //   RecommendedCompany(
  //     urlImg:
  //         'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/768px-Google_%22G%22_logo.svg.png',
  //     companyName: 'Google',
  //     companyShortName: 'GOOGL',
  //   ),
  //   RecommendedCompany(
  //     urlImg:
  //         'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Amazon_icon.svg/2500px-Amazon_icon.svg.png',
  //     companyName: 'Amazon',
  //     companyShortName: 'AMZN',
  //   ),
  //   RecommendedCompany(
  //     urlImg:
  //         'https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/meta-icon.png',
  //     companyName: 'Meta',
  //     companyShortName: 'META',
  //   ),
  //   RecommendedCompany(
  //     urlImg:
  //         'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAhFBMVEXz8/PzUyWBvAYFpvD/ugjz9fb19Pbz+fr39fr69vPy9foAofD/tgDzRQB9ugAAo/Df6dCv0Xjz2dPzTBfzl4PznImz04CAx/H60oHS5vJ5xPH60Hn16dIAnvDz7u3z4t7n7dzzNADzkXurz3BwtQDzvrLM36zf6/Os2PL336z07d/7z3RN8WfWAAABg0lEQVR4nO3cyVLCYBCFURwCkXlygDBFUBTf//3cSGIVf5WrDi7O9wJdp3p/Wy1JkvSrLLzqVDu8FHAzjW57JrZ34+hSH5yWg9jK187PrXx/GMZ2GF9+MZsObmKbzSvhZHgb25CQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCwUWE5i21QC/fB86Xp/dLt/DG4t/MGbf7+FNxkl9jZzTrR1TvCeXjJIWFJkv7uIbzqVDe8LAE8Lp+D+zgTu5/FS2zFKUFcrEex9ZaV8Ksf3Sol7N3FNqqFRf8+NkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQsJmhetebOtr75dmi+iO1anTKrrNJbDRsvCuDJQk6Z/1DSzvYqEfRCNJAAAAAElFTkSuQmCC',
  //     companyName: 'Microsoft',
  //     companyShortName: 'MSFT',
  //   ),
  //   RecommendedCompany(
  //     urlImg:
  //         'https://upload.wikimedia.org/wikipedia/sco/thumb/2/21/Nvidia_logo.svg/527px-Nvidia_logo.svg.png?20150924223142',
  //     companyName: 'NVIDIA',
  //     companyShortName: 'NVDA',
  //   ),
  //   RecommendedCompany(
  //     urlImg:
  //         'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/814px-Apple_logo_black.svg.png',
  //     companyName: 'Apple',
  //     companyShortName: 'AAPL',
  //   )
  // ];
  //
  // List<String> suggestions = searchResults.where((searchResult) {
  //   final result = searchResult.toLowerCase();
  //   final input = query.toLowerCase();
  //
  //   return result.contains(input);
  // }).toList();
  //
  // return Column(
  //   crossAxisAlignment: CrossAxisAlignment.start,
  //   children: [
  //     Expanded(
  //       child: ListView.builder(
  //         itemCount: suggestions.length,
  //         itemBuilder: (context, index) {
  //           final suggestion = suggestions[index];
  //
  //           return ListTile(
  //             title: Text(suggestion),
  //             onTap: () {},
  //           );
  //         },
  //       ),
  //     ),
  //     Expanded(
  //       flex: 1,
  //       child: GridView.count(
  //         primary: false,
  //         padding: const EdgeInsets.all(20),
  //         crossAxisSpacing: 10,
  //         mainAxisSpacing: 10,
  //         crossAxisCount: 4,
  //         children: companies.map((company) {
  //           return buildRecommendedCompanyCard(
  //             context: context,
  //             urlImg: company.urlImg,
  //             companyShortName: company.companyName,
  //           );
  //         }).toList(),
  //       ),
  //     ),
  //   ],
  // );
}

class _SearchResults extends ConsumerWidget {
  final String query;

  const _SearchResults(this.query);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final companies = ref.watch(searchProvider(query));

    return ListView.separated(
      primary: true,
      itemCount: companies.length,
      itemBuilder: (context, index) {
        final company = companies[index];
        return CompanyItem(
          company,
          key: Key(company.ticker),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          const Divider(height: 2),
    );
  }
}
