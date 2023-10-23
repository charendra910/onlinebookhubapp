import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:onlinebookhubapp/screens/book_detail.dart';
import 'package:onlinebookhubapp/services/utils.dart';
import 'package:onlinebookhubapp/widgets/on_sale_widget.dart';
import 'package:onlinebookhubapp/widgets/text_widget.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = "/OnSaleScreen";
   OnSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool _isEmpty = false;
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;

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
          text: 'Products on sale',
          color: color,
          textSize: 24.0,
          isTitle: true,
        ),
      ),
      body: _isEmpty
          // ignore: dead_code
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Image.asset('assets/images/box.png', ),
                    ),
                    Text(
                      'No products on sale yet!,\nStay tuned',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: color, fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            )
          : FutureBuilder(
            future: FirebaseFirestore.instance.collection('products').get(),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
              }
              return GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                children: snapshot.data!.docs.map((document) {
                    Map<String, dynamic> book = document.data();
                    return InkWell(
                      onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> BookDetailPage(description: 'This book is the best for explaining to kids science and engineering.', imageUrl: "https://m.media-amazon.com/images/I/91ZIq6xEqGL._AC_UF1000,1000_QL80_.jpg", price: double.parse(book['price']), title: book['name'],),),);

                      },
                      child: OnSaleWidget(image:book['img'], name:book['name'],weight: book['weight'],price: book['price'],salePrice: book['price'],));
                  }).toList());
          })
    );
  }
}
