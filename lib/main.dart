import 'package:flutter/material.dart';
import 'package:yellowcardblog/data/articles_datasource.dart';
import 'package:yellowcardblog/data/articles_static.dart';
import 'package:yellowcardblog/data/categories_datasource.dart';
import 'package:yellowcardblog/data/categories_static.dart';
import 'package:yellowcardblog/models/article.dart';
import 'package:yellowcardblog/screens/article_details_screen.dart';
import 'package:yellowcardblog/screens/home_responsive_screen.dart';
import 'package:yellowcardblog/screens/unknow_article_screen.dart';

void main() {
  runApp(YellowcardBlogApp());
}

class YellowcardBlogApp extends StatefulWidget {
  createState() => _YellowcardBlogAppState();
}

class _YellowcardBlogAppState extends State<YellowcardBlogApp> {
  Article? _selectedArticle;
  bool show404 = false;
  final CategoriesDataSource categoriesDataSource = CategoriesStatic();
  final ArticlesDataSource articlesDataSource = ArticlesStatic();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yellowcard Blog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Navigator(
        pages: [
          MaterialPage(
            key: ValueKey("ArticlesListPage"),
            child: HomeResponsiveScreen(
              categoriesDataSource: categoriesDataSource,
              articlesDataSource: articlesDataSource,
              articleClicked: _articleClicked,
            ),
          ),
          if (show404)
            MaterialPage(
              key: ValueKey('UnknownPage'),
              child: UnknowArticleScreen(),
            )
          else if (_selectedArticle != null)
            ArticleDetailsPage(
              article: _selectedArticle!,
            )
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }

          // Update the list of pages by setting _selectedBook to null
          setState(() {
            _selectedArticle = null;
          });

          return true;
        },
      ),
      /*
      DemoScreen(
        categoriesDataSource: CategoriesStatic(),
        articlesDataSource: ArticlesStatic(),
      ),
      */
    );
  }

  _articleClicked(Article article) {
    setState(() {
      _selectedArticle = article;
    });
  }
}

class ArticleDetailsPage extends Page {
  final Article article;

  ArticleDetailsPage({
    required this.article,
  }) : super(key: ValueKey(article));

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return ArticleDetailsScreen(
          article: article,
        );
      },
    );
  }
}
