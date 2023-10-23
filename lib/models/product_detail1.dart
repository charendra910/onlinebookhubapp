import 'package:flutter/material.dart';


class prod extends StatefulWidget {
  @override
  State<prod> createState() => _MyAppState();
}

class _MyAppState extends State<prod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Product Details')),
        ),
        body: Center(
          child: ProductDetails(
            imageUrl:
                'https://files.realpython.com/media/python-basics-3d-transparent-centered.1600697390a8.png',
            name: 'Python',
            brand: 'Asmita',
            description:
                "Python is widely considered among the easiest programming languages for beginners to learn. If you're interested in learning a programming language, Python is a good place to start.",
            price: 19.99,
            quantity: 5,
          ),
        ),
      );
  }
}

class ProductDetails extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String brand;
  final String description;
  final double price;
  final int quantity;

  ProductDetails({
    required this.imageUrl,
    required this.name,
    required this.brand,
    required this.description,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.network(
          imageUrl,
          width: 200,
          height: 200,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 20),
        Text(
          'Name: $name',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          'Brand: $brand',
          style: TextStyle(fontSize: 18),
        ),
        Text(
          'Description: $description',
          style: TextStyle(fontSize: 16),
        ),
        Text(
          'Price: \$${price.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 18, color: Colors.green),
        ),
        Text(
          'Quantity: $quantity',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
