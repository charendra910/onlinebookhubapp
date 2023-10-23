
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:onlinebookhubapp/widgets/price_widget.dart';
import 'package:onlinebookhubapp/widgets/text_widget.dart';
import '../services/utils.dart';


class OnSaleWidget extends StatefulWidget {

  final String name;
  final String weight;
  final String salePrice;
  final String price;
  final String image;
   OnSaleWidget({super.key, required this.name, required this.weight, required this.price, required this.salePrice, required this.image});

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {


  @override
  Widget build( BuildContext context) {
    final Color color = Utils(context).color;
    final theme = Utils(context).getTheme;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding( 
      padding: const EdgeInsets.all(8.0),
      child: Material(
        //color: Theme.of(context).cardColor.withOpacity(0.9),
       // color: Theme.of(context).cardColor.withOpacity(0.9),
        color: Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FancyShimmerImage(
                          imageUrl:widget.image,
                              height: width*0.22,
                              width: width*0.22,
                              boxFit: BoxFit.fill,
                              ),
                      Column(
                        children: [
                          TextWidget(
                           text: widget.weight,                           
                            color: color,
                            textSize: 22,
                            isTitle: true,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          // Row(
                          //   children: [
                          //     GestureDetector(
                          //       onTap: () {},
                          //       child: Icon(
                          //         IconlyLight.bag2,
                          //         size: 22,
                          //         color: color,
                          //       ),
                          //     ),
                          //    // HeartBTN(),
                          //   ],
                          // ),
                        ],
                      ),
                    ],
                  ),
                    PriceWidget(
                     salePrice: widget.price,
                        price: widget.salePrice,
                        textPrice: '1',
                        isOnSale: true,
                   ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextWidget(
                    text: widget.name,
                    color: color,
                    textSize: 16,
                    isTitle: true,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
