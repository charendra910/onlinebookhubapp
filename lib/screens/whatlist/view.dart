import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:onlinebookhubapp/services/utils.dart';
import 'package:onlinebookhubapp/widgets/on_sale_widget.dart';
import 'package:onlinebookhubapp/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class view extends StatelessWidget {
  const view({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
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
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
            text: 'View Product', color: color, isTitle: true, textSize: 22),
        
      ),
      body: Column(
        children: [
          
          OnSaleWidget(
                              image:
                                  "https://m.media-amazon.com/images/I/418ow0JdGSL.jpg",
                              name: 'Basic Python',
                              price: '\$ 2.3',
                              salePrice: '\$1.4',
                              weight: '120',
                            ),],
      ),
     
    );
  }

  
}
