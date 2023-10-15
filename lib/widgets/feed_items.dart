import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlinebookhubapp/services/utils.dart';
import 'package:onlinebookhubapp/widgets/heart_btn.dart';
import 'package:onlinebookhubapp/widgets/price_widget.dart';
import 'package:onlinebookhubapp/widgets/text_widget.dart';

class FeedsWidget extends StatefulWidget {
  const FeedsWidget({super.key});

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
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Column(
            children: [
              FancyShimmerImage(
                 imageUrl: 'https://static-00.iconduck.com/assets.00/open-book-icon-2048x2048-wuklhx59.png',
                //imageUrl: productModel.imageUrl,
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
                      text: 'Title',
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
                        salePrice: '2.99',
                        price: '5.9',
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
                            onChanged: (value){
                              setState(() {
                                
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
             const  Spacer(),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: TextWidget(
                    text: 'Add to cart',
                    color: color,
                    maxLines: 1,
                    textSize: 20,
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).cardColor),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          )
                        )
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
