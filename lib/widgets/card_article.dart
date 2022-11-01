import 'package:flutter/material.dart';
import 'package:news_app/data/models/article.dart';
import 'package:news_app/styles/styles.dart';
import 'package:provider/provider.dart';

import '../common/navigation.dart';
import '../pages/detail_page.dart';
import '../provider/database_provider.dart';

class CardArticle extends StatelessWidget {
  final Article article;

  const CardArticle({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<bool>(
          future: provider.isBookmarked(article.url),
          builder: (context, snapshot) {
            var isBookmarked = snapshot.data ?? false;
            return Material(
              color: primaryColor,
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                leading: Hero(
                  tag: article.urlToImage!,
                  child: Image.network(
                    article.urlToImage!,
                    width: 100,
                  ),
                ),
                title: Text(article.title),
                subtitle: Text(article.author ?? "Unknown"),
                trailing: isBookmarked
                    ? IconButton(
                        onPressed: () {
                          provider.removeBookmark(article.url);
                        },
                        icon: const Icon(Icons.bookmark),
                        color: Theme.of(context).colorScheme.secondary,
                      )
                    : IconButton(
                        onPressed: () {
                          provider.addBookmark(article);
                        },
                        icon: const Icon(Icons.bookmark_border),
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                onTap: () => Navigation.intentWithData(
                    ArticleDetailPage.routeName, article),
              ),
            );
          },
        );
      },
    );
  }
}
