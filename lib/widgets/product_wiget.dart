import 'package:fake_store_app/constants.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({Key? key}) : super(key: key);

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    var _deviceHeight = MediaQuery.of(context).size.height;

    return Material(
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.white,
      child: InkWell(
        onTap: () {
          print("hello");
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("1000 F"),
                  Icon(
                    IconlyBold.heart,
                    color: ColorManager.kPrimaryColor,
                  ),
                ],
              ),
              FancyShimmerImage(
                height: _deviceHeight * 0.2,
                width: double.infinity,
                errorWidget: Icon(
                  IconlyBold.danger,
                ),
                imageUrl: "https://i.ibb.co/Z8yxGBF/shoes-17841.png",
                boxFit: BoxFit.fill,
              ),
              Text("Tilte"),
            ],
          ),
        ),
      ),
    );
  }
}
