import 'dart:async';

import 'package:yellowcardblog/data/categories_datasource.dart';
import 'package:yellowcardblog/models/category.dart';

class CategoriesBloc {
  final CategoriesDataSource categoriesDataSource;
  CategoriesBloc(
    this.categoriesDataSource,
  );
  final _categoriesStreamController =
      StreamController<List<Category>>.broadcast();

  List<Category> _categories = [];
  StreamSink<List<Category>> get _inAdd => _categoriesStreamController.sink;

  Stream<List<Category>> get categories => _categoriesStreamController.stream;

  void dispose() => _categoriesStreamController.close();

  void fetchCategories() async {
    _categories = await categoriesDataSource.getCategories();
    _inAdd.add(_categories);
  }

  void setSelected(String categoryId) {
    _categories.forEach((element) {
      element.selected = element.id == categoryId;
    });
    _inAdd.add(_categories);
  }
}
