import 'package:flutter/material.dart';
import 'package:yellowcardblog/data/categories_datasource.dart';
import 'package:yellowcardblog/widgets/categories_list_view.dart';

class HomeScreen extends StatefulWidget {
  final CategoriesDataSource categoriesDataSource;
  HomeScreen({
    required this.categoriesDataSource,
  });
  createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Yellowcard",
        ),
      ),
      body: CategoriesListView(
        categoriesDataSource: widget.categoriesDataSource,
        categorySelected: _categorySelected,
      ),
    );
  }

  _categorySelected(String categoryId) {}
}
