import 'package:flutter/material.dart';
import 'package:yellowcardblog/data/articles_datasource.dart';
import 'package:yellowcardblog/data/articles_static.dart';
import 'package:yellowcardblog/data/categories_datasource.dart';
import 'package:yellowcardblog/data/categories_static.dart';
import 'package:yellowcardblog/models/article.dart';
import 'package:yellowcardblog/router/article_route_path.dart';
import 'package:yellowcardblog/screens/article_details_screen.dart';
import 'package:yellowcardblog/screens/home_responsive_screen.dart';
import 'package:yellowcardblog/screens/unknow_article_screen.dart';

class ArticleRouterDelegate extends RouterDelegate<ArticleRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<ArticleRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Article? _selectedArticle;
  bool show404 = false;
  final ArticlesDataSource articlesDataSource = ArticlesStatic();
  final CategoriesDataSource categoriesDataSource = CategoriesStatic();
  ArticleRoutePath get currentConfiguration {
    if (show404) {
      return ArticleRoutePath.unknown();
    }

    return _selectedArticle == null
        ? ArticleRoutePath.home()
        : ArticleRoutePath.details(_selectedArticle!.id);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
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
        _selectedArticle = null;
        show404 = false;
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(ArticleRoutePath path) async {
    if (path.isUnknown) {
      _selectedArticle = null;
      show404 = true;
      return;
    }

    if (path.isDetailsPage && path.id != null) {
      _selectedArticle = await articlesDataSource.getArticleById(path.id!);
      show404 = _selectedArticle == null;
    } else {
      _selectedArticle = null;
      show404 = false;
    }
  }

  _articleClicked(Article article) {
    _selectedArticle = article;
    notifyListeners();
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
