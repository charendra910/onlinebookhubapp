import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:onlinebookhubapp/screens/whatlist/whatchlist.dart';
import 'package:onlinebookhubapp/services/utils.dart';

class Nursery extends StatefulWidget {
  @override
  State<Nursery> createState() => _MyAppState();
}

class _MyAppState extends State<Nursery> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    return Scaffold(
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
          child: GestureDetector(
            onTap: () {
              // Navigate to the WatchList page when the image is tapped
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => WatchScreen()));
            },
            child: ProductDetails(
              imageUrl:
                  'https://5.imimg.com/data5/AG/SP/GLADMIN-10535359/fun-field-nursery-rhymes-b-book.png',
              name: 'Nursery',
              brand: 'Asmita',
              description:
                  "Commercial nurseries produce and distribute woody and herbaceous plants, including ornamental trees, shrubs, and bulb crops.",
              price: 3.99,
              quantity: 4,
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
