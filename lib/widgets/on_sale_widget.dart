import 'dart:ffi';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:onlinebookhubapp/screens/book_detail.dart';
import 'package:onlinebookhubapp/widgets/price_widget.dart';
import 'package:onlinebookhubapp/widgets/text_widget.dart';

import '../services/utils.dart';
import 'heart_btn.dart';


class OnSaleWidget extends StatefulWidget {

  final String name;
  final String weight;
  final String salePrice;
  final String price;
   OnSaleWidget({super.key, required this.name, required this.weight, required this.price, required this.salePrice});

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
                          imageUrl:
                              'https://m.media-amazon.com/images/I/418ow0JdGSL.jpg',
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
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  IconlyLight.bag2,
                                  size: 22,
                                  color: color,
                                ),
                              ),
                              HeartBTN(),
                            ],
                          ),
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












































































// import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:onlinebookhubapp/services/global_methods.dart';
// import 'package:onlinebookhubapp/services/utils.dart';
// import 'package:onlinebookhubapp/widgets/heart_btn.dart';
// import 'package:onlinebookhubapp/widgets/price_widget.dart';
// import 'package:onlinebookhubapp/widgets/text_widget.dart';
// import 'package:provider/provider.dart';

// class OnSaleWidget extends StatefulWidget {
//   const OnSaleWidget({Key? key}) : super(key: key);

//   @override
//   State<OnSaleWidget> createState() => _OnSaleWidgetState();
// }

// class _OnSaleWidgetState extends State<OnSaleWidget> {
//   @override
//   Widget build(BuildContext context) {
//     final Color color = Utils(context).color;
//     // final productModel = Provider.of<ProductModel>(context);
//     final theme = Utils(context).getTheme;
//     Size size = Utils(context).getScreenSize;
//     // final cartProvider = Provider.of<CartProvider>(context);
//     // bool? _isInCart = cartProvider.getCartItems.containsKey(productModel.id);
//     // final wishlistProvider = Provider.of<WishlistProvider>(context);
// //     bool? _isInWishlist =
// //         wishlistProvider.getWishlistItems.containsKey(productModel.id);

//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Material(
//         color: Theme.of(context).cardColor.withOpacity(0.9),
//         borderRadius: BorderRadius.circular(12),
//         child: InkWell(
//           borderRadius: BorderRadius.circular(12),
//           onTap: () {
//             // Navigator.pushNamed(context, ProductDetails.routeName,
//             //     arguments: productModel.id);
//             // GlobalMethods.navigateTo(
//             //     ctx: context, routeName: ProductDetails.routeName);
//           },
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 // mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       FancyShimmerImage(
//                         imageUrl: productModel.imageUrl,
//                         height: size.width * 0.22,
//                         width: size.width * 0.22,
//                         boxFit: BoxFit.fill,
//                       ),
//                       Column(
//                         children: [
//                           TextWidget(
//                             text: productModel.isPiece ? '1Piece' : '1KG',
//                             color: color,
//                             textSize: 22,
//                             isTitle: true,
//                           ),
//                           const SizedBox(
//                             height: 6,
//                           ),
//                           Row(
//                             children: [
//                               GestureDetector(
//                                 onTap: _isInCart
//                                     ? null
//                                     : () async {
//                                         final User? user =
//                                             authInstance.currentUser;

//                                         if (user == null) {
//                                           GlobalMethods.errorDialog(
//                                               subtitle:
//                                                   'No user found, Please login first',
//                                               context: context);
//                                           return;
//                                         }
//                                         await GlobalMethods.addToCart(
//                                             productId: productModel.id,
//                                             quantity: 1,
//                                             context: context);
//                                         await cartProvider.fetchCart();
//                                         // cartProvider.addProductsToCart(
//                                         //     productId: productModel.id,
//                                         //     quantity: 1);
//                                       },
//                                 child: Icon(
//                                   _isInCart
//                                       ? IconlyBold.bag2
//                                       : IconlyLight.bag2,
//                                   size: 22,
//                                   color: _isInCart ? Colors.green : color,
//                                 ),
//                               ),
//                               HeartBTN(
//                                 productId: productModel.id,
//                                 isInWishlist: _isInWishlist,
//                               )
//                             ],
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                   PriceWidget(
//                     salePrice: productModel.salePrice,
//                     price: productModel.price,
//                     textPrice: '1',
//                     isOnSale: true,
//                   ),
//                   const SizedBox(height: 5),
//                   TextWidget(
//                     text: productModel.title,
//                     color: color,
//                     textSize: 16,
//                     isTitle: true,
//                   ),
//                   const SizedBox(height: 5),
//                 ]),
//           ),
//         ),
//       ),
//     );
//   }
// }
