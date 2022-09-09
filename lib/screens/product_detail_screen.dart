// ignore_for_file: prefer_const_constructors

import 'package:card_swiper/card_swiper.dart';
import 'package:fake_store_app/constants.dart';
import 'package:fake_store_app/models/Product.dart';
import 'package:fake_store_app/models/dataProvider.dart';
import 'package:fake_store_app/utils.dart';
import 'package:fake_store_app/widgets/carroussel_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  int? productID;

  ProductDetailScreen({this.productID});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  Product? product;

  Future<void> getSingleProduct() async {
    product = await Provider.of<DataProvider>(context, listen: false)
        .getSingleProduct(widget.productID);
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    getSingleProduct();

    super.didChangeDependencies();
  }

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
      body: product == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
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
                          product!.title.toString(),
                          style: TextStyle(
                            fontSize: 18.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("\$ ${product!.price.toString()}"),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: _deviceHeight * 0.3,
                      child: Swiper(
                        autoplay: true,
                        itemCount: product!.images!.length,
                        itemBuilder: (ctx, index) {
                          return FancyShimmerImage(
                            height: _deviceHeight * 0.2,
                            width: double.infinity,
                            errorWidget: Icon(
                              IconlyBold.danger,
                            ),
                            imageUrl: imageChecker(product!.images![index]),
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
                      product!.description.toString(),
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
