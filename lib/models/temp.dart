import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:onlinebookhubapp/models/product_detail1.dart';
import 'package:onlinebookhubapp/services/utils.dart';
import 'package:onlinebookhubapp/widgets/feed_items.dart';
import 'package:onlinebookhubapp/widgets/text_widget.dart';

class tem extends StatefulWidget {
  static const routeName = "/FeedsScreenState";

  const tem({super.key});

  @override
  State<tem> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<tem> {
  // ... other code ...

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      // ... other code ...
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ... other code ...

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              childAspectRatio: size.width / (size.height * 0.59),
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => prod()),
                    );
                  },
                  child: FeedsWidget(
                    salePrice: '1.2',
                    name: "Chemistry",
                    image: 'https://m.media-amazon.com/images/I/418ow0JdGSL.jpg',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => prod()),
                    );
                  },
                  child: FeedsWidget(
                    salePrice: '2.5',
                    name: "Physics",
                    image: 'https://m.media-amazon.com/images/I/418ow0JdGSL.jpg',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => prod()),
                    );
                  },
                  child: FeedsWidget(
                    salePrice: '3.0',
                    name: "Biology",
                    image: 'https://m.media-amazon.com/images/I/418ow0JdGSL.jpg',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => prod()),
                    );
                  },
                  child: FeedsWidget(
                    salePrice: '1.8',
                    name: "Mathematics",
                    image: 'https://m.media-amazon.com/images/I/418ow0JdGSL.jpg',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
