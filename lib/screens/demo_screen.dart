import 'package:flutter/material.dart';
import 'package:yellowcardblog/data/articles_datasource.dart';
import 'package:yellowcardblog/data/categories_datasource.dart';
import 'package:yellowcardblog/models/article.dart';
import 'package:yellowcardblog/screens/articles_screen.dart';
import 'package:yellowcardblog/screens/categories_screen.dart';
import 'package:yellowcardblog/screens/home_full_screen.dart';
import 'package:yellowcardblog/screens/home_navigation_screen.dart';
import 'package:yellowcardblog/screens/home_responsive_screen.dart';

class DemoScreen extends StatefulWidget {
  final CategoriesDataSource categoriesDataSource;
  final ArticlesDataSource articlesDataSource;
  DemoScreen({
    required this.categoriesDataSource,
    required this.articlesDataSource,
  });
  createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  final _demoMenus = [
    'Categories',
    'Articles (Responsive)',
    'Home & Categories (Full)',
    'Home & Categories (Drawer)',
    'Home & Categories (Responsive)'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Web Demo',
        ),
      ),
      body: ListView(
        children: _menus(),
      ),
    );
  }

  List<Widget> _menus() {
    var menus = <Widget>[];
    for (int i = 0; i < _demoMenus.length; i++) {
      menus.add(
        GestureDetector(
          onTap: () => _menuClicked(i),
          child: ListTile(
            title: Text(
              _demoMenus[i],
            ),
          ),
        ),
      );
    }
    return menus;
  }

  _menuClicked(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => CategoriesScreen(
              categoriesDataSource: widget.categoriesDataSource,
            ),
          ),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ArticlesScreen(
              articlesDataSource: widget.articlesDataSource,
            ),
          ),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => HomeFullScreen(
              categoriesDataSource: widget.categoriesDataSource,
              articlesDataSource: widget.articlesDataSource,
              articleClicked: _articleClicked,
            ),
          ),
        );
        break;
      case 3:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => HomeNavigationScreen(
              categoriesDataSource: widget.categoriesDataSource,
              articlesDataSource: widget.articlesDataSource,
              articleClicked: _articleClicked,
            ),
          ),
        );
        break;
      case 4:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => HomeResponsiveScreen(
              categoriesDataSource: widget.categoriesDataSource,
              articlesDataSource: widget.articlesDataSource,
              articleClicked: _articleClicked,
            ),
          ),
        );
        break;
    }
  }

  _articleClicked(Article article) {}
}
