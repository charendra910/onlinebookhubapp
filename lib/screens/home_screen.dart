import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:onlinebookhubapp/inner_screens/feeds_screen.dart';
import 'package:onlinebookhubapp/inner_screens/on_sale_screen.dart';
import 'package:onlinebookhubapp/models/biology.dart';
import 'package:onlinebookhubapp/models/chemistry.dart';
import 'package:onlinebookhubapp/models/math.dart';
import 'package:onlinebookhubapp/models/physic.dart';
import 'package:onlinebookhubapp/services/global_methods.dart';
import 'package:onlinebookhubapp/services/utils.dart';
import 'package:onlinebookhubapp/widgets/feed_items.dart';
import 'package:onlinebookhubapp/widgets/on_sale_widget.dart';
import 'package:onlinebookhubapp/widgets/text_widget.dart';

import '../models/product_detail1.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _offerImages = [
    'assets/images/offres/slide1.jpg',
    'assets/images/offres/slide2.jpeg',
    'assets/images/offres/slide3.webp',
    'assets/images/offres/slide4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    final Color color = Utils(context).color;
    //Size size = Utils(context).getScreenSize;
    Size size = utils.getScreenSize;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.33,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    _offerImages[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: _offerImages.length,
                pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.white,
                    activeColor: Colors.red,
                  ),
                ),
                control: const SwiperControl(color: Colors.amber),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            TextButton(
              onPressed: () {
                GlobalMethods.navigateTo(
                    ctx: context, routeName: OnSaleScreen.routeName);
              },
              child: TextWidget(
                text: "View all",
                maxLines: 1,
                color: Colors.blue,
                textSize: 20,
              ),
            ),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      TextWidget(
                        text: 'On sale'.toUpperCase(),
                        color: Colors.red,
                        textSize: 22,
                        isTitle: true,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        IconlyLight.discount,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: SizedBox(
                    height: size.height * 0.24,
                    child: ListView.builder(
                        itemCount: 1,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return InkWell(
                            onDoubleTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => prod()));
                            },
                            child: OnSaleWidget(
                              image:
                                  "https://m.media-amazon.com/images/I/418ow0JdGSL.jpg",
                              name: 'Basic Python',
                              price: '\$ 2.3',
                              salePrice: '\$1.4',
                              weight: '120',
                            ),
                          );
                        }),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    height: size.height * 0.24,
                    child: ListView.builder(
                        itemCount: 1,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return InkWell(
                            onDoubleTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => biology()));
                            },
                            child: OnSaleWidget(
                              image:
                                  "https://www.theodist.com/Images/ProductImages/Large/78775.jpg",
                              name: 'Advance Python',
                              price: '\$ 4.3',
                              salePrice: '\$1.8',
                              weight: '160',
                            ),
                          );
                        }),
                  ),
                ),

                // Flexible(
                //   child: SizedBox(
                //     height: size.height * 0.24,
                //     child: ListView.builder(
                //         itemCount: 1,
                //         scrollDirection: Axis.horizontal,
                //         itemBuilder: (ctx, index) {
                //           return OnSaleWidget(name: 'History', price: '\$ 6.3', salePrice: '\$3.4', weight: '400',);
                //         }),
                //   ),

                // ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'Our products',
                    color: color,
                    textSize: 22,
                    isTitle: true,
                  ),
                  // const Spacer(),
                  TextButton(
                    onPressed: () {
                      GlobalMethods.navigateTo(
                          ctx: context, routeName: FeedsScreen.routeName);
                    },
                    child: TextWidget(
                      text: "Browse all",
                      maxLines: 1,
                      color: Colors.blue,
                      textSize: 20,
                    ),
                  ),
                ],
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
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => chemistry()));
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
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => physic()));
                  },
                  child: FeedsWidget(
                      salePrice: '2.5',
                      name: "Physics",
                      image:
                          'https://5.imimg.com/data5/HX/TD/MY-14344381/nootan-physics-xii-book.png'),
                ),
                InkWell(
                  onDoubleTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => biology()));
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
