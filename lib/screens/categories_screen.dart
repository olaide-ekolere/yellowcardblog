import 'package:flutter/material.dart';
import 'package:yellowcardblog/bloc/categoies_bloc.dart';
import 'package:yellowcardblog/data/categories_datasource.dart';
import 'package:yellowcardblog/widgets/categories_list_view.dart';

class CategoriesScreen extends StatefulWidget {
  final CategoriesDataSource categoriesDataSource;
  CategoriesScreen({
    required this.categoriesDataSource,
  });
  createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Categories",
        ),
      ),
      body: CategoriesListView(
        categoriesBloc: CategoriesBloc(widget.categoriesDataSource),
        categorySelected: _categorySelected,
      ),
    );
  }

  _categorySelected(String categoryId) {}
}
