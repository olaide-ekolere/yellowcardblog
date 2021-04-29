import 'package:flutter/material.dart';
import 'package:yellowcardblog/models/article.dart';

class ArticleListItem extends StatelessWidget {
  final Article article;
  final Function(String) articleClicked;
  final double height;
  ArticleListItem({
    required this.article,
    required this.articleClicked,
    required this.height,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => articleClicked(
        article.id,
      ),
      child: Card(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                article.imageUrl.isNotEmpty
                    ? article.imageUrl
                    : 'https://images.prismic.io/yellowcard-website/8b591b45-b06d-4dde-a31a-0b3e8eeb42ff_Wallet.jpg',
                fit: BoxFit.cover,
                height: height,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 8.0,
                ),
                child: Text(
                  article.title,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 0.0,
                ),
                child: Text(
                  article.publishDate,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 0.0,
                ),
                child: Text(
                  article.text,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
