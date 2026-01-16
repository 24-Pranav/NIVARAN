
class Document {
  final String title;
  final String url;

  Document({required this.title, required this.url});

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      title: json['title'],
      url: json['url'],
    );
  }
}
