import 'package:flutter/material.dart';
import 'package:yellowcardblog/bloc/articles_bloc.dart';
import 'package:yellowcardblog/data/articles_datasource.dart';
import 'package:yellowcardblog/widgets/articles_grid_view.dart';

class ArticlesScreen extends StatefulWidget {
  final ArticlesDataSource articlesDataSource;
  ArticlesScreen({
    required this.articlesDataSource,
  });
  createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Articles",
        ),
      ),
      body: ArticlesGridView(
        articlesBloc: ArticlesBloc(widget.articlesDataSource),
        articleSelected: _articleSelected,
        categoryId: '0',
      ),
    );
  }

  _articleSelected(String articleId) {}
}
