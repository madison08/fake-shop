// ignore_for_file: prefer_const_constructors

import 'package:card_swiper/card_swiper.dart';
import 'package:fake_store_app/constants.dart';
import 'package:fake_store_app/widgets/carroussel_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var _deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: ColorManager.kPrimaryColor,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "product detail",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Category",
                style: TextStyle(fontSize: 17.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "lorem ipsum",
                    style: TextStyle(
                      fontSize: 18.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("\$ 168.0"),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: _deviceHeight * 0.3,
                child: Swiper(
                  autoplay: true,
                  itemCount: 3,
                  itemBuilder: (ctx, index) {
                    return FancyShimmerImage(
                      height: _deviceHeight * 0.2,
                      width: double.infinity,
                      errorWidget: Icon(
                        IconlyBold.danger,
                      ),
                      imageUrl: "https://i.ibb.co/Z8yxGBF/shoes-17841.png",
                      boxFit: BoxFit.fill,
                    );
                  },
                  pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      activeColor: ColorManager.kPrimaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Description",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non rhoncus dolor. Mauris euismod nec nibh a hendrerit. Quisque posuere purus ac blandit faucibus. Aenean vel felis interdum, tristique nisi mollis, bibendum nulla. Morbi magna lorem, aliquam quis posuere in, interdum at ipsum. Ut vitae lacinia sem. Maecenas vel ultricies felis, auctor vulputate nulla.Phasellus cursus, massa eu gravida pulvinar, turpis elit efficitur odio, sit amet consectetur quam mi vitae justo. In hac habitasse platea dictumst. Fusce vestibulum, lectus at egestas volutpat, metus quam commodo velit, eu ullamcorper neque est eu lacus. In eget tortor eleifend, fermentum sem vitae, sagittis mi. Suspendisse sit amet tincidunt dui. Integer lacus massa, luctus sed mi suscipit, dignissim suscipit metus. Aliquam ac risus in sem ultricies pellentesque posuere sed erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Cras non sem nisl. Duis feugiat dignissim ultricies.",
                style: TextStyle(
                  fontSize: 17.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
