import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:onlinebookhubapp/services/utils.dart';
import 'package:onlinebookhubapp/widgets/heart_btn.dart';
import 'package:onlinebookhubapp/widgets/text_widget.dart';

class CartWidget extends StatefulWidget {
  final String name;
  final String salePrice;
  final String image;
  final String quantity;

  CartWidget({
    required this.name,
    required this.salePrice,
    required this.image,
    required this.quantity,
    Key? key,
  }) : super(key: key);

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  
  void removeItemFromCart() {
    FirebaseFirestore.instance
        .collection('cart')
        .where('name', isEqualTo: widget.name)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        doc.reference.delete(); 
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;

    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      height: size.width * 0.25,
                      width: size.width * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: FancyShimmerImage(
                        imageUrl: widget.image,
                        boxFit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: widget.name,
                          color: color,
                          textSize: 20,
                          isTitle: true,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextWidget(
                          text: 'Quantity: ${widget.quantity}',
                          color: color,
                          textSize: 18,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          InkWell(
                            onTap:
                                removeItemFromCart, 
                            child: const Icon(
                              Icons.remove_shopping_cart,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const HeartBTN(),
                          TextWidget(
                            text: '\$${widget.salePrice}',
                            color: color,
                            textSize: 18,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
