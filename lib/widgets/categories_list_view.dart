import 'package:flutter/material.dart';
import 'package:yellowcardblog/bloc/categoies_bloc.dart';
import 'package:yellowcardblog/listitems/category_list_item.dart';
import 'package:yellowcardblog/models/category.dart';
import 'package:yellowcardblog/widgets/common/responsive_widget.dart';

class CategoriesListView extends StatefulWidget {
  final CategoriesBloc categoriesBloc;
  final Function(String) categorySelected;
  CategoriesListView({
    required this.categoriesBloc,
    required this.categorySelected,
  });
  createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  late CategoriesBloc _categoriesBloc;
  @override
  void initState() {
    super.initState();
    _categoriesBloc = widget.categoriesBloc;
    _categoriesBloc.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _categoriesBloc.categories,
      builder: (context, AsyncSnapshot<List<Category>> snapshot) {
        if (snapshot.hasError) {
          return _errorWidget();
        } else if (snapshot.hasData) {
          return _bodyWidget(snapshot.data);
        } else {
          return _loadingWidget();
        }
      },
    );
  }

  Widget _errorWidget() {
    return Container(
      color: Colors.red,
    );
  }

  Widget _loadingWidget() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _bodyWidget(List<Category>? data) {
    if (data == null || data.isEmpty) {
      return _emptyWidget();
    } else {
      return ResponsiveWidget(
        smallScreen: _contentWidget(data),
        mediumScreen: _contentWidget(data),
        largeScreen: _contentWidget(data),
      );
    }
  }

  Widget _emptyWidget() {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.hourglass_empty,
            ),
          ],
        ),
      ),
    );
  }

  Widget _contentWidget(List<Category> data) {
    return ListView(
      children: data
          .map(
            (category) => CategoryListItem(
              category: category,
              categoryClicked: widget.categorySelected,
            ),
          )
          .toList(),
    );
  }
}
