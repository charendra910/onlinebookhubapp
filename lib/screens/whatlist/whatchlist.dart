import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:onlinebookhubapp/services/utils.dart';
import 'package:onlinebookhubapp/widgets/on_sale_widget.dart';
import 'package:onlinebookhubapp/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WatchScreen extends StatelessWidget {
  const WatchScreen({super.key});

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
            text: 'Watchlist', color: color, isTitle: true, textSize: 22),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              IconlyBroken.delete,
              color: color,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          OnSaleWidget(
                              image:
                                  "https://5.imimg.com/data5/HX/TD/MY-14344381/nootan-physics-xii-book.png",
                              name: 'Physic',
                              price: '\$ 2.3',
                              salePrice: '\$1.4',
                              weight: '120',
                            ),
          _checkout(ctx: context),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('watchlist').snapshots(),
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                final cartData = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: cartData.length,
                  itemBuilder: (ctx, index) {
                    
                  },
                );
              },
            ),
          ),
          
        ],
      ),
    );
  }

  Widget _checkout({required BuildContext ctx}) {
    Size size = Utils(ctx).getScreenSize;
    final Color color = Utils(ctx).color;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
         
        ),
        
      ),
    );
  }
}
