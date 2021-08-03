import 'package:yellowcardblog/models/article.dart';

abstract class ArticlesDataSource {
  Future<List<Article>> getArticles(String? categoryId);
  Future<Article> getArticleById(String id);
}
