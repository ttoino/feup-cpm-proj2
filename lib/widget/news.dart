import 'package:flutter/material.dart';
import 'package:meerkat/model/news.dart';

class NewsCard extends StatelessWidget {
  final News news;

  const NewsCard(this.news, {super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 256,
        child: Card.filled(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {},
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

class NewsFullWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const NewsFullWidget({super.key, 
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      shadowColor: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
