import 'package:flutter/material.dart';
import 'package:yellowcardblog/data/categories_datasource.dart';
import 'package:yellowcardblog/data/categories_static.dart';
import 'package:yellowcardblog/screens/categories_screen.dart';

class DemoScreen extends StatefulWidget {
  final CategoriesDataSource categoriesDataSource;
  DemoScreen({
    required this.categoriesDataSource,
  });
  createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  final _demoMenus = [
    'Categories',
    'Articles (Responsive)',
    'Home & Categories (Navigation)',
    'Home & Categories (Full)'
        'Home & Categories (Responsive)'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Web Demo',
        ),
      ),
      body: ListView(
        children: _menus(),
      ),
    );
  }

  List<Widget> _menus() {
    var menus = <Widget>[];
    for (int i = 0; i < _demoMenus.length; i++) {
      menus.add(
        GestureDetector(
          onTap: () => _menuClicked(i),
          child: ListTile(
            title: Text(
              _demoMenus[i],
            ),
          ),
        ),
      );
    }
    return menus;
  }

  _menuClicked(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => CategoriesScreen(
              categoriesDataSource: widget.categoriesDataSource,
            ),
          ),
        );
        break;
    }
  }
}
