class Document {
  final String title;
  final String url;
  final bool isFolder;
  final bool isLink;

  Document({required this.title, required this.url, this.isFolder = false, this.isLink = false});

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      title: json['title'],
      url: json['url'],
      isFolder: json['isFolder'] ?? false,
      isLink: json['isLink'] ?? false,
    );
  }
}
