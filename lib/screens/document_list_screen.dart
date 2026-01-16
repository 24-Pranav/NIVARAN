import 'package:flutter/material.dart';
import 'package:nivaran/models/category.dart';
import 'package:url_launcher/url_launcher.dart';

class DocumentListScreen extends StatelessWidget {
  final Category category;

  const DocumentListScreen({super.key, required this.category});

  IconData _getIconForUrl(String url) {
    if (category.name == 'Important Website Links') {
      return Icons.link;
    } else if (url.endsWith('.pdf')) {
      return Icons.picture_as_pdf;
    } else if (url.contains('docs.google.com/presentation')) {
      return Icons.slideshow;
    } else if (url.contains('drive.google.com/drive/folders')) {
      return Icons.folder;
    } else {
      return Icons.article_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: category.documents.isEmpty
          ? const Center(child: Text('No documents in this category.'))
          : GridView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: category.documents.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemBuilder: (context, index) {
                var document = category.documents[index];
                return GestureDetector(
                  onTap: () async {
                    final url = Uri.parse(document.url.replaceAll(' ', ''));
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url, mode: LaunchMode.externalApplication);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Could not open the document: ${document.url}'),
                        ),
                      );
                    }
                  },
                  child: Card(
                    elevation: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(_getIconForUrl(document.url), size: 50, color: Colors.orange),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            document.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
