import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:onlinebookhubapp/services/utils.dart';


class astronomy extends StatefulWidget {
  @override
  State<astronomy> createState() => _MyAppState();
}

class _MyAppState extends State<astronomy> {
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
                  'https://www.planetary-astronomy-and-imaging.com/wp-content/uploads/2020/12/couv1_small.png',
              name: 'Astronomy',
              brand: 'Asmita',
              description:
                  "Astronomy is widely considered among the easiest programming languages for beginners to learn. If you're interested in learning a programming language, Python is a good place to start.",
              price: 19.99,
              quantity: 5,
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
