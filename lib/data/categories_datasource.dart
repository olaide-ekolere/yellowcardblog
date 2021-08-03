import 'package:yellowcardblog/models/category.dart';

abstract class CategoriesDataSource {
  Future<List<Category>> getCategories();
}
