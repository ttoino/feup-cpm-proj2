import 'package:flutter/material.dart';
import 'package:meerkat/model/news.dart';
import 'package:url_launcher/url_launcher_string.dart';


class NewsCard extends StatelessWidget {
  final News news;

  const NewsCard(this.news, {super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 256,
        child: Card.filled(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {launchUrlString(news.url);},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Ink.image(
                    image: NetworkImage(
                        news.bannerImage ?? 'https://picsum.photos/256/144'),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news.title,
                        overflow: TextOverflow.ellipsis,
                        style:
                            Theme.of(context).typography.englishLike.bodyLarge,
                      ),
                      Text(
                        news.source,
                        style: Theme.of(context)
                            .typography
                            .englishLike
                            .bodyMedium
                            ?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

