import 'package:flutter/material.dart';
import 'package:yellowcardblog/bloc/articles_bloc.dart';
import 'package:yellowcardblog/bloc/categoies_bloc.dart';
import 'package:yellowcardblog/data/articles_datasource.dart';
import 'package:yellowcardblog/data/categories_datasource.dart';
import 'package:yellowcardblog/models/article.dart';
import 'package:yellowcardblog/widgets/articles_grid_view.dart';
import 'package:yellowcardblog/widgets/categories_list_view.dart';

class HomeFullScreen extends StatefulWidget {
  final CategoriesDataSource categoriesDataSource;
  final ArticlesDataSource articlesDataSource;
  final Function(Article) articleClicked;
  HomeFullScreen({
    required this.articlesDataSource,
    required this.categoriesDataSource,
    required this.articleClicked,
  });
  createState() => _HomeFullScreenState();
}

class _HomeFullScreenState extends State<HomeFullScreen> {
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
          "Home & Categories (Full)",
        ),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: CategoriesListView(
              categoriesBloc: _categoriesBloc,
              categorySelected: _categorySelected,
            ),
          ),
          Expanded(
            flex: 2,
            child: ArticlesGridView(
              articlesBloc: _articlesBloc,
              articleSelected: widget.articleClicked,
              categoryId: '0',
            ),
          ),
        ],
      ),
    );
  }

  _categorySelected(String categoryId) {
    _categoriesBloc.setSelected(categoryId);
    _articlesBloc.fetchArticles(categoryId);
  }
}
