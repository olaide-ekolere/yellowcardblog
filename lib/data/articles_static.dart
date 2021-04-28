import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:yellowcardblog/data/articles_datasource.dart';
import 'package:yellowcardblog/models/article.dart';

class ArticlesStatic extends ArticlesDataSource {
  @override
  Future<List<Article>> getArtciles() async {
    List<Article> articles = await _loadArticlesFromJson();
    return articles;
  }

  @override
  Future<Article> getArticleById(String id) async {
    // TODO: implement getArticleById
    throw UnimplementedError();
  }

  Future<List<Article>> _loadArticlesFromJson() async {
    List<Article> articles = [];
    try {
      String jsonContent = await rootBundle.loadString("assets/data.json");
      Map<dynamic, dynamic> localisedValues = json.decode(jsonContent);
      articles = List.from(localisedValues['articles'])
          .map(
            (e) => Article.fromMap(
              Map<String, dynamic>.from(e),
            ),
          )
          .toList();
    } catch (e) {
      print(e);
    }
    return articles;
  }
}
