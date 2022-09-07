import 'package:fake_store_app/constants.dart';
import 'package:fake_store_app/models/Product.dart';
import 'package:fake_store_app/screens/product_detail_screen.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProductWidget extends StatelessWidget {
  Product? product;

  ProductWidget({required this.product});

  @override
  Widget build(BuildContext context) {
    var _deviceHeight = MediaQuery.of(context).size.height;

    print("PRODUCT PARSING: $product");

    return Material(
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.white,
      child: InkWell(
        onTap: () {
          print("hello");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ProductDetailScreen();
              },
            ),
          );
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
                imageUrl: product!.images![0].toString(),
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
