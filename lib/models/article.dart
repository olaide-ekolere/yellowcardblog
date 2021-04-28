class Article {
  final String id;
  final String title;
  final String text;
  final String imageUrl;
  final String publishDate;
  final String categoryId;
  Article({
    required this.id,
    required this.title,
    required this.text,
    required this.imageUrl,
    required this.publishDate,
    required this.categoryId,
  });

  Article.fromMap(Map<String, dynamic> data)
      : this.id = data['id'],
        this.title = data['title'],
        this.text = data['text'],
        this.imageUrl = data['imageUrl'],
        this.publishDate = data['publishDate'],
        this.categoryId = data['categoryId'];
}
