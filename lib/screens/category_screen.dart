import 'package:fake_store_app/constants.dart';
import 'package:fake_store_app/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: ColorManager.kPrimaryColor,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Categorie",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          // shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 7.0,
            crossAxisSpacing: 7.0,
            childAspectRatio: 0.8,
          ),
          itemCount: 10,
          itemBuilder: (ctx, index) {
            return CategoryWidget();
          },
        ),
      ),
    );
  }
}
