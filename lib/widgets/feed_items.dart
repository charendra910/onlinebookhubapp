// ignore_for_file: sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlinebookhubapp/services/utils.dart';
import 'package:onlinebookhubapp/widgets/heart_btn.dart';
import 'package:onlinebookhubapp/widgets/price_widget.dart';
import 'package:onlinebookhubapp/widgets/text_widget.dart';

class FeedsWidget extends StatefulWidget {
  final String name;
  final String salePrice;
  final String image;

  // Constructor with named parameters
  FeedsWidget({
    Key? key,
    required this.name,
    required this.salePrice,
    required this.image,
  }) : super(key: key);

  @override
  State<FeedsWidget> createState() => _FeedsWidgetState();
}

class _FeedsWidgetState extends State<FeedsWidget> {
  final _quantityTextController = TextEditingController();

  @override
  void initState() {
    _quantityTextController.text = "1";
    super.initState();
  }

  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  Future<void> addToCart() async {
    try {
      int quantity = int.parse(_quantityTextController.text);
      double totalPrice = double.parse(widget.salePrice) * quantity;

      await FirebaseFirestore.instance.collection('cart').add({
        'name': widget.name,
        'salePrice': widget.salePrice,
        'image': widget.image,
        'quantity': quantity,
        'totalPrice': totalPrice,
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Product added to cart')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add product to cart')));
    }
  }
  

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {
            // Add your onTap action here (e.g., navigate to product details).
          },
          borderRadius: BorderRadius.circular(12),
          child: Column(
            children: [
              FancyShimmerImage(
                imageUrl: widget.image, // Use the provided image URL
                height: size.width * 0.21,
                width: size.width * 0.2,
                boxFit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: widget.name, // Display the product name
                      color: color,
                      textSize: 20,
                      isTitle: true,
                    ),
                    const HeartBTN(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 4,
                      child: PriceWidget(
                        salePrice: widget.salePrice, // Display the sale price
                        price: widget
                            .salePrice, // Display the regular price (you can change this)
                        textPrice: _quantityTextController.text,
                        isOnSale: true,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: FittedBox(
                              child: TextWidget(
                                text: "KG",
                                color: color,
                                textSize: 18,
                                isTitle: true,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Flexible(
                              flex: 2,
                              child: TextFormField(
                                controller: _quantityTextController,
                                key: const ValueKey('10'),
                                style: TextStyle(color: color, fontSize: 18),
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                                enabled: true,
                                onChanged: (value) {
                                  setState(() {
                                    // Handle quantity changes if needed
                                  });
                                },
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp('[0-9.]'),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: addToCart, // Call the addToCart function
                  child: TextWidget(
                    text: 'Add to cart',
                    color: color,
                    maxLines: 1,
                    textSize: 20,
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).cardColor,
                      ),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      )))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
