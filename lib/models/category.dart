import 'document.dart';

class Category {
  final String name;
  final List<Document> documents;
  final List<Category> subCategories;

  Category({
    required this.name,
    this.documents = const [],
    this.subCategories = const [],
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    var documentsList = json['documents'] as List? ?? [];
    List<Document> docs = documentsList.map((i) => Document.fromJson(i)).toList();

    var subCategoriesList = json['subCategories'] as List? ?? [];
    List<Category> subs = subCategoriesList.map((i) => Category.fromJson(i)).toList();

    return Category(
      name: json['category'],
      documents: docs,
      subCategories: subs,
    );
  }
}
