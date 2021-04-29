import 'package:flutter/material.dart';
import 'package:yellowcardblog/router/article_route_parser.dart';
import 'package:yellowcardblog/router/article_router_delegate.dart';

void main() {
  runApp(YellowcardBlogApp());
}

class YellowcardBlogApp extends StatefulWidget {
  createState() => _YellowcardBlogAppState();
}

class _YellowcardBlogAppState extends State<YellowcardBlogApp> {
  ArticleRouterDelegate _routerDelegate = ArticleRouterDelegate();
  ArticleRouteInformationParser _routeInformationParser =
      ArticleRouteInformationParser();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Yellowcard Blog',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}
