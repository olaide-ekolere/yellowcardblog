import 'package:yellowcardblog/models/article.dart';

abstract class ArticlesDataSource {
  Future<List<Article>> getArtciles();
  Future<Article> getArticleById(String id);
}
