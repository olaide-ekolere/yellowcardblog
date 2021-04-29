import 'package:flutter/material.dart';
import 'package:yellowcardblog/data/articles_datasource.dart';
import 'package:yellowcardblog/data/categories_datasource.dart';
import 'package:yellowcardblog/screens/home_full_screen.dart';
import 'package:yellowcardblog/screens/home_navigation_screen.dart';
import 'package:yellowcardblog/widgets/common/responsive_widget.dart';

class HomeResponsiveScreen extends StatefulWidget {
  final CategoriesDataSource categoriesDataSource;
  final ArticlesDataSource articlesDataSource;
  HomeResponsiveScreen({
    required this.articlesDataSource,
    required this.categoriesDataSource,
  });
  createState() => _HomeResponsiveScreenState();
}

class _HomeResponsiveScreenState extends State<HomeResponsiveScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      smallScreen: HomeNavigationScreen(
        categoriesDataSource: widget.categoriesDataSource,
        articlesDataSource: widget.articlesDataSource,
      ),
      mediumScreen: HomeFullScreen(
        categoriesDataSource: widget.categoriesDataSource,
        articlesDataSource: widget.articlesDataSource,
      ),
      largeScreen: HomeFullScreen(
        categoriesDataSource: widget.categoriesDataSource,
        articlesDataSource: widget.articlesDataSource,
      ),
    );
  }
}
