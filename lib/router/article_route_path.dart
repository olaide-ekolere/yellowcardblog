class ArticleRoutePath {
  final String? id;
  final bool isUnknown;

  ArticleRoutePath.home()
      : id = null,
        isUnknown = false;

  ArticleRoutePath.details(this.id) : isUnknown = false;

  ArticleRoutePath.unknown()
      : id = null,
        isUnknown = true;

  bool get isHomePage => id == null;

  bool get isDetailsPage => id != null;
}
