import 'document.dart';

class Category {
  final String name;
  final List<Document> documents;

  Category({required this.name, required this.documents});

  factory Category.fromJson(Map<String, dynamic> json) {
    var documentsList = json['documents'] as List;
    List<Document> docs = documentsList.map((i) => Document.fromJson(i)).toList();
    return Category(
      name: json['category'],
      documents: docs,
    );
  }
}
