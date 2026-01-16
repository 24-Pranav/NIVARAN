import 'package:flutter/material.dart';
import 'package:nivaran/models/category.dart';
import 'package:url_launcher/url_launcher.dart';

class DocumentListScreen extends StatelessWidget {
  final Category category;

  const DocumentListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: category.documents.isEmpty
          ? const Center(child: Text('No documents in this category.'))
          : ListView.builder(
              itemCount: category.documents.length,
              itemBuilder: (context, index) {
                var document = category.documents[index];
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.picture_as_pdf),
                    title: Text(document.title),
                    onTap: () async {
                      final Uri url = Uri.parse(document.url);
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Could not open the document.'),
                          ),
                        );
                      }
                    },
                  ),
                );
              },
            ),
    );
  }
}
