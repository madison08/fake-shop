import 'dart:developer';

import 'package:fake_store_app/models/Product.dart';
import 'package:fake_store_app/models/dataProvider.dart';
import 'package:fake_store_app/widgets/feed_widget.dart';
import 'package:fake_store_app/widgets/product_wiget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  List<Product>? listProducts = [];

  final ScrollController _scrollController = ScrollController();

  int limit = 10;
  bool _isLoading = false;
  bool _isLimit = false;

  Future<void> getAllproducts() async {
    listProducts = await Provider.of<DataProvider>(context, listen: false)
        .getAllProducts(limit: limit);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState

    getAllproducts();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    super.didChangeDependencies();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        limit = limit + 10;

        if (limit == 200) {
          _isLimit = true;
          setState(() {});
          return;
        }
        log("limit $limit");
        await getAllproducts();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text(
          "Tous les produits",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: listProducts!.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  GridView.builder(
                      // controller: _scrollController,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0.0,
                        crossAxisSpacing: 0.0,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: listProducts!.length,
                      itemBuilder: (ctx, index) {
                        return ProductWidget(
                          product: listProducts![index],
                        );
                      }),
                  !_isLimit
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(),
                ],
              ),
            ),
    );
  }
}
