import 'package:fake_store_app/constants.dart';
import 'package:fake_store_app/models/Category.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CategoryWidget extends StatelessWidget {
  Category category;

  CategoryWidget({required this.category});

  @override
  Widget build(BuildContext context) {
    var _deviceHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          // Container(
          //   decoration: BoxDecoration(
          //     color: ColorManager.kPrimaryColor,
          //     borderRadius: BorderRadius.circular(10.0),
          //   ),
          // ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: FancyShimmerImage(
                height: _deviceHeight * 0.2,
                width: double.infinity,
                errorWidget: Icon(
                  IconlyBold.danger,
                ),
                imageUrl: category.image.toString(),
                boxFit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(7.0),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Text(
                category.name.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
