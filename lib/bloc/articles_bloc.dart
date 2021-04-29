import 'dart:async';

import 'package:yellowcardblog/data/articles_datasource.dart';
import 'package:yellowcardblog/models/article.dart';

class ArticlesBloc {
  final ArticlesDataSource articlesDataSource;
  ArticlesBloc(
    this.articlesDataSource,
  );
  final _articlesStreamController = StreamController<List<Article>>.broadcast();

  List<Article> _articles = [];
  StreamSink<List<Article>> get _inAdd => _articlesStreamController.sink;

  Stream<List<Article>> get articles => _articlesStreamController.stream;

  void dispose() => _articlesStreamController.close();

  void fetchArticles(String categoryId) async {
    _articles = await articlesDataSource.getArticles(categoryId);
    _inAdd.add(_articles);
  }
}
