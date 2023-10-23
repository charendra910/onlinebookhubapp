import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:onlinebookhubapp/models/astronomy.dart';
import 'package:onlinebookhubapp/models/biology.dart';
import 'package:onlinebookhubapp/models/chemistry.dart';
import 'package:onlinebookhubapp/models/math.dart';
import 'package:onlinebookhubapp/models/physic.dart';
import 'package:onlinebookhubapp/models/product_detail1.dart';
import 'package:onlinebookhubapp/services/utils.dart';
import 'package:onlinebookhubapp/widgets/feed_items.dart';
import 'package:onlinebookhubapp/widgets/text_widget.dart';

import '../screens/home_screen.dart';

class FeedsScreen extends StatefulWidget {
  static const routeName = "/FeedsScreenState";
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  final TextEditingController? _searchTextController = TextEditingController();
  final FocusNode _searchTextFocusNode = FocusNode();
  @override
  void dispose() {
    _searchTextController!.dispose();
    _searchTextFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        centerTitle: true,
        title: TextWidget(
          text: 'All Products',
          color: color,
          textSize: 20.0,
          isTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: kBottomNavigationBarHeight,
                child: TextField(
                  focusNode: _searchTextFocusNode,
                  controller: _searchTextController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(color: Colors.greenAccent, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(color: Colors.greenAccent, width: 1),
                    ),
                    hintText: "What's in your mind?",
                    prefixIcon: const Icon(Icons.search),
                    suffix: IconButton(
                      onPressed: () {
                        _searchTextController!.clear();
                        _searchTextFocusNode.unfocus();
                      },
                      icon: Icon(
                        Icons.close,
                        color:
                            _searchTextFocusNode.hasFocus ? Colors.red : color,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              // crossAxisSpacing: 10,
              childAspectRatio: size.width / (size.height * 0.59),
              children: [
                InkWell(
                  onDoubleTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => chemistry()));
                  },
                  child: FeedsWidget(
                      salePrice: '1.2',
                      name: "Chemistry",
                      image:
                          'https://images.blinkist.io/images/books/5f0d636f6cee0700061678d1/1_1/470.jpg'),
                ),
                //Wrap the widget with InkWell onTap
                InkWell(
                  onDoubleTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => physic()));
                  },
                  child: FeedsWidget(
                      salePrice: '2.5',
                      name: "Physics",
                      image:
                          'https://5.imimg.com/data5/HX/TD/MY-14344381/nootan-physics-xii-book.png'),
                ),
                InkWell(
                  onDoubleTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => biology()));
                  },
                  child: FeedsWidget(
                      salePrice: '3.0',
                      name: "Biology",
                      image:
                          'https://www.theodist.com/Images/ProductImages/Large/78775.jpg'),
                ),
                InkWell(
                  onDoubleTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => maths()));
                  },
                  child: FeedsWidget(
                      salePrice: '1.8',
                      name: "Mathematics",
                      image:
                          'https://yellowbirdpublications.com/wp-content/uploads/2022/10/Magic-with-Maths-7-Front-01-min.png'),
                ),
                InkWell(
                  onDoubleTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => astronomy()));
                  },
                  child: FeedsWidget(
                      salePrice: '3.8',
                      name: "Astronomy",
                      image:
                          'https://www.planetary-astronomy-and-imaging.com/wp-content/uploads/2020/12/couv1_small.png'),
                ),
                InkWell(
                  onDoubleTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => prod()));
                  },
                  child: FeedsWidget(
                      salePrice: '4.6',
                      name: "Python",
                      image:
                          'https://files.realpython.com/media/python-basics-3d-transparent-centered.1600697390a8.png'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
