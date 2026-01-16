import 'package:flutter/material.dart';
import 'package:nivaran/models/category.dart';
import 'package:nivaran/models/document.dart';
import 'package:url_launcher/url_launcher.dart';

class DocumentListScreen extends StatelessWidget {
  final Category category;

  const DocumentListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final combinedList = [...category.documents, ...category.subCategories];

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: combinedList.isEmpty
          ? const Center(child: Text('This category is empty.'))
          : GridView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: combinedList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) {
                final item = combinedList[index];

                if (item is Document) {
                  return DocumentItem(document: item);
                } else if (item is Category) {
                  return CategoryItem(category: item);
                }
                return const SizedBox.shrink();
              },
            ),
    );
  }
}

class DocumentItem extends StatelessWidget {
  const DocumentItem({
    super.key,
    required this.document,
  });

  final Document document;

  IconData _getIcon() {
    if (document.isFolder) {
      return Icons.folder;
    } else if (document.isLink) {
      return Icons.link;
    } else {
      return Icons.picture_as_pdf;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (document.url.isEmpty) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Document Unavailable'),
                content: const Text(
                    'This document is not available at the moment. Please check back later.'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        } else {
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
        }
      },
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(_getIcon(), size: 50, color: Colors.orange),
            const SizedBox(height: 10),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  document.title,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DocumentListScreen(category: category),
          ),
        );
      },
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.folder, size: 50, color: Colors.orange),
            const SizedBox(height: 10),
            Text(
              category.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
