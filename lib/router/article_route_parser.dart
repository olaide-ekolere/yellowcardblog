import 'package:flutter/material.dart';
import 'package:yellowcardblog/router/article_route_path.dart';

class ArticleRouteInformationParser
    extends RouteInformationParser<ArticleRoutePath> {
  @override
  Future<ArticleRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    // Handle '/'
    if (uri.pathSegments.length == 0) {
      return ArticleRoutePath.home();
    }

    // Handle '/article/:id'
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] != 'article') return ArticleRoutePath.unknown();
      var remaining = uri.pathSegments[1];
      String id = remaining;
      //if (id == null) return ArticleRoutePath.unknown();
      return ArticleRoutePath.details(id);
    }

    // Handle unknown routes
    return ArticleRoutePath.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(ArticleRoutePath path) {
    if (path.isUnknown) {
      return RouteInformation(location: '/404');
    }
    if (path.isHomePage) {
      return RouteInformation(location: '/');
    }
    if (path.isDetailsPage) {
      return RouteInformation(location: '/article/${path.id}');
    }
    return RouteInformation();
  }
}
