import 'package:fake_store_app/constants.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _deviceHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: ColorManager.kPrimaryColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        Center(
          child: FancyShimmerImage(
            height: _deviceHeight * 0.2,
            width: double.infinity,
            errorWidget: Icon(
              IconlyBold.danger,
            ),
            imageUrl:
                "https://i.ibb.co/ggSq6cb/kisspng-hoodie-polar-fleece-product-neck-red-m-5ba33ab86d9962-3074928815374240564489.png",
            boxFit: BoxFit.fill,
          ),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.all(7.0),
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: Text(
              "Clothes",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
