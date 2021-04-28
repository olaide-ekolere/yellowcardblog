import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:yellowcardblog/data/categories_datasource.dart';
import 'package:yellowcardblog/models/category.dart';

class CategoriesStatic extends CategoriesDataSource {
  @override
  Future<List<Category>> getCategories() async {
    List<Category> categories = await _loadCategoriesFromJson();
    return categories;
  }

  Future<List<Category>> _loadCategoriesFromJson() async {
    List<Category> categories = [];
    try {
      String jsonContent = await rootBundle.loadString("assets/data.json");
      //print('Before ${locale.languageCode}');
      Map<dynamic, dynamic> localisedValues = json.decode(jsonContent);
      categories = List.from(localisedValues['categories'])
          .map(
            (e) => Category.fromMap(
              Map<String, dynamic>.from(e),
            ),
          )
          .toList();
    } catch (e) {
      print(e);
    }
    return categories;
  }
}
