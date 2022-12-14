import 'package:fake_store_app/models/Product.dart';
import 'package:fake_store_app/widgets/product_wiget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class FeedsWidget extends StatefulWidget {
  final List<Product>? products;

  FeedsWidget({this.products});

  @override
  State<FeedsWidget> createState() => _FeedsWidgetState();
}

class _FeedsWidgetState extends State<FeedsWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
          childAspectRatio: 0.75,
        ),
        itemCount: widget.products!.length,
        itemBuilder: (ctx, index) {
          return ProductWidget(
            product: widget.products![index],
          );
        });
  }
}
