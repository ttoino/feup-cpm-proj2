import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meerkat/screen/chart.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meerkat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Meerkat'), actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.newspaper),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchDelegate(),
              );
            },
          ),
        ]),
        body: /*ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChartScreen('AAPL'),
              ),
            );
          },
          child: const Text('Show Chart'))*/
            SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  SizedBox(width: 8),
                  // Add some space between the icon and the text
                  Text(
                    "Trending news",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.trending_up,
                    size: 35,
                  ),
                  // Add the house icon
                ],
              ),
            ),
            Container(
              height: 256,
              child: ListView(
                padding: EdgeInsets.all(16),
                scrollDirection: Axis.horizontal,
                children: [
                  buildNewsCard(
                      newsItem: NewsItem(
                          urlImage:
                              "https://image.cnbcfm.com/api/v1/image/105446906-1536773767389gettyimages-1032224004.jpeg?v=1564565238",
                          description:
                              "Apple sells 96 iPhones for 4 cents and everyone gets crazy for it...")),
                  SizedBox(width: 12),
                  buildNewsCard(
                      newsItem: NewsItem(
                          urlImage:
                              "https://i.insider.com/66328794ec0c696569ffcbfe?width=700",
                          description:
                              "NVIDIA involved in Drake and Kendrick fight over job position of workk after stopping diss rap battles and becoming homeless"))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Top 10 Stocks",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            createCompanyCard(
              context: context,
              urlImg:
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/768px-Google_%22G%22_logo.svg.png',
              companyName: 'Google',
              companyShortName: 'GOOGLE',
              companyStock: 100,
            ),
            createCompanyCard(
              context: context,
              urlImg:
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Amazon_icon.svg/2500px-Amazon_icon.svg.png',
              companyName: 'Amazon',
              companyShortName: 'AMAZON',
              companyStock: 150,
            ),
            createCompanyCard(
              context: context,
              urlImg:
                  'https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/meta-icon.png',
              companyName: 'Meta Platforms, Inc.',
              companyShortName: 'META',
              companyStock: 233,
            ),
            createCompanyCard(
              context: context,
              urlImg:
                  'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAhFBMVEXz8/PzUyWBvAYFpvD/ugjz9fb19Pbz+fr39fr69vPy9foAofD/tgDzRQB9ugAAo/Df6dCv0Xjz2dPzTBfzl4PznImz04CAx/H60oHS5vJ5xPH60Hn16dIAnvDz7u3z4t7n7dzzNADzkXurz3BwtQDzvrLM36zf6/Os2PL336z07d/7z3RN8WfWAAABg0lEQVR4nO3cyVLCYBCFURwCkXlygDBFUBTf//3cSGIVf5WrDi7O9wJdp3p/Wy1JkvSrLLzqVDu8FHAzjW57JrZ34+hSH5yWg9jK187PrXx/GMZ2GF9+MZsObmKbzSvhZHgb25CQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCwUWE5i21QC/fB86Xp/dLt/DG4t/MGbf7+FNxkl9jZzTrR1TvCeXjJIWFJkv7uIbzqVDe8LAE8Lp+D+zgTu5/FS2zFKUFcrEex9ZaV8Ksf3Sol7N3FNqqFRf8+NkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQsJmhetebOtr75dmi+iO1anTKrrNJbDRsvCuDJQk6Z/1DSzvYqEfRCNJAAAAAElFTkSuQmCC',
              companyName: 'Microsoft',
              companyShortName: 'MSFT',
              companyStock: 0,
            ),
            createCompanyCard(
              context: context,
              urlImg:
                  'https://upload.wikimedia.org/wikipedia/sco/thumb/2/21/Nvidia_logo.svg/527px-Nvidia_logo.svg.png?20150924223142',
              companyName: 'NVIDIA Corporation',
              companyShortName: 'NVIDIA',
              companyStock: 3943,
            ),
            createCompanyCard(
              context: context,
              urlImg:
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/814px-Apple_logo_black.svg.png',
              companyName: 'Apple',
              companyShortName: 'APPL',
              companyStock: 0,
            ),
          ]),
        ));
  }
}

class NewsItem {
  final String urlImage;
  final String description;

  const NewsItem({required this.urlImage, required this.description});
}

Widget buildNewsCard({required NewsItem newsItem}) => Container(
    width: 250,
    height: 150,
    child: Column(
      children: [
        Expanded(
            child: AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Material(
                      child: Ink.image(
                        image: NetworkImage(newsItem.urlImage),
                        fit: BoxFit.cover,
                        child: InkWell(onTap: () => {}),
                      ),
                    )))),
        const SizedBox(height: 4),
        Text(newsItem.description,
            style: TextStyle(fontSize: 20), overflow: TextOverflow.ellipsis)
      ],
    ));

Widget createCompanyCard({
  required BuildContext context,
  required String urlImg,
  required String companyName,
  required String companyShortName,
  required int companyStock,
}) {
  return Card(
    child: ListTile(
      leading: Image.network(
        urlImg,
        width: 56.0,
        height: 56.0,
      ),
      title: Text(companyName),
      subtitle: Text(companyShortName),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("$companyStock\$"),
          const Icon(Icons.arrow_right),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChartScreen(companyShortName),
          ),
        );
      },
    ),
  );
}

// ========= For Search ============

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty){
              close(context, null);
            } else {
            query = '';
            }
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }
}

