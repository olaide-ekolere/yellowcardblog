import 'package:flutter/material.dart';

class UnknowArticleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unknown Article'),
      ),
      body: Container(
        child: Center(
          child: Icon(
            Icons.error,
            size: 64.0,
          ),
        ),
      ),
    );
  }
}
