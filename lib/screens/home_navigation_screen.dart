import 'package:flutter/material.dart';
import 'package:yellowcardblog/bloc/articles_bloc.dart';
import 'package:yellowcardblog/bloc/categoies_bloc.dart';
import 'package:yellowcardblog/data/articles_datasource.dart';
import 'package:yellowcardblog/data/categories_datasource.dart';
import 'package:yellowcardblog/models/article.dart';
import 'package:yellowcardblog/widgets/articles_grid_view.dart';
import 'package:yellowcardblog/widgets/categories_list_view.dart';

class HomeNavigationScreen extends StatefulWidget {
  final CategoriesDataSource categoriesDataSource;
  final ArticlesDataSource articlesDataSource;
  final Function(Article) articleClicked;
  HomeNavigationScreen({
    required this.articlesDataSource,
    required this.categoriesDataSource,
    required this.articleClicked,
  });
  createState() => _HomeNavigationScreenState();
}

class _HomeNavigationScreenState extends State<HomeNavigationScreen> {
  late CategoriesBloc _categoriesBloc;
  late ArticlesBloc _articlesBloc;
  @override
  void initState() {
    super.initState();
    _categoriesBloc = CategoriesBloc(
      widget.categoriesDataSource,
    );
    _articlesBloc = ArticlesBloc(
      widget.articlesDataSource,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home & Categories (Drawer)",
        ),
      ),
      drawer: Drawer(
        child: CategoriesListView(
          categoriesBloc: _categoriesBloc,
          categorySelected: _categorySelected,
        ),
      ),
      body: ArticlesGridView(
        articlesBloc: _articlesBloc,
        articleSelected: widget.articleClicked,
        categoryId: '0',
      ),
    );
  }

  _categorySelected(String categoryId) {
    _categoriesBloc.setSelected(categoryId);
    _articlesBloc.fetchArticles(categoryId);
    Navigator.of(context).pop(); //close drawer
  }
}
