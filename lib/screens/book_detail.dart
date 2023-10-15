import 'package:flutter/material.dart';

class BookDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  BookDetailPage({
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Image on the top
            Image.network(
              imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            // 2. Title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // 2. Description
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(description),
            ),
            // 2. Price
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Price: \$${price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // 2. Buy item button (in orange)
            ElevatedButton(
              onPressed: () {
                // Implement the buy action here
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
              child: Text('Buy Item'),
            ),
            // 2. Add to cart button (in orange)
            ElevatedButton(
              onPressed: () {
                // Implement the add to cart action here
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}