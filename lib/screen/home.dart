import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meerkat/provider/company.dart';
import 'package:meerkat/screen/news.dart';
import 'package:meerkat/screen/search.dart';
import 'package:meerkat/widget/company.dart';
import 'package:meerkat/widget/news_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.newspaper),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NewsScreen(),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => showSearch(
              context: context,
              delegate: MeerkatSearchDelegate(),
            ),
          ),
        ],
      ),
      body: ListView(
        primary: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  "Trending news",
                  style: Theme.of(context).typography.englishLike.titleLarge,
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.trending_up,
                  size: Theme.of(context)
                      .typography
                      .englishLike
                      .titleLarge
                      ?.fontSize,
                ),
              ],
            ),
          ),
          const RecommendedNewsList(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Top stocks",
              style: Theme.of(context).typography.englishLike.titleLarge,
            ),
          ),
          const _CompanyList(),
        ],
      ),
      // ),
    );
  }
}

class _CompanyList extends ConsumerWidget {
  const _CompanyList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final companies = ref.watch(companiesProvider);

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 16),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
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
