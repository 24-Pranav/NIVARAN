import 'package:flutter/material.dart';
import 'package:nivaran/models/category.dart';
import 'package:nivaran/screens/document_list_screen.dart';

class SubCategoryScreen extends StatelessWidget {
  final Category category;

  const SubCategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: category.subCategories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (context, index) {
          Category subCategory = category.subCategories[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DocumentListScreen(category: subCategory),
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
                    subCategory.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
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
