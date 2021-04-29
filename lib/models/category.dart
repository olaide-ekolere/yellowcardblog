class Category extends _Selectable {
  final String id;
  final String name;
  Category({
    required this.id,
    required this.name,
  });

  Category.fromMap(Map<String, dynamic> data)
      : this.id = data['id'],
        this.name = data['name'];
}

class _Selectable {
  bool selected = false;
}
