import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:onlinebookhubapp/services/utils.dart';


class chemistry extends StatefulWidget {
  @override
  State<chemistry> createState() => _MyAppState();
}

class _MyAppState extends State<chemistry> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            IconlyLight.arrowLeft2,
            color: color,
          ),
        ),
          title: Center(child: Text('Product Details')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: ProductDetails(
              imageUrl:
                  'https://images.blinkist.io/images/books/5f0d636f6cee0700061678d1/1_1/470.jpg',
              name: 'Chemistry',
              brand: 'Asmita',
              description:
                  " Chemistry requires you to memorise a lot of formulas, equations, and reactions. Hence, you should make notes and practice them by writing them down to memorise Make a note of all the concepts, theories, and explanations as well.",
              price: 12.99,
              quantity: 7,
            ),
          ),
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
