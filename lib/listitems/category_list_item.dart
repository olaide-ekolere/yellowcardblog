import 'package:flutter/material.dart';
import 'package:yellowcardblog/models/category.dart';

class CategoryListItem extends StatelessWidget {
  final Category category;
  final Function(String) categoryClicked;
  CategoryListItem({
    required this.category,
    required this.categoryClicked,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => categoryClicked(
        category.id,
      ),
      child: Container(
        color: category.selected ? Colors.yellow : Colors.white,
        child: ListTile(
          leading: Icon(
            Icons.menu_book,
          ),
          title: Text(
            category.name,
          ),
        ),
      ),
    );
  }
}
