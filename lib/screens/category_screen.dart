import 'package:fake_store_app/constants.dart';
import 'package:fake_store_app/models/Category.dart';
import 'package:fake_store_app/models/dataProvider.dart';
import 'package:fake_store_app/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

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
      body: FutureBuilder<dynamic>(
        future: Provider.of<DataProvider>(context, listen: false)
            .getAllCategories(),
        builder: (context, AsyncSnapshot snapshot) {
          print("future builder data: ${snapshot.data}");

          List<Category>? categories = snapshot.data;

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Quelque chose s'est mal passer");
            } else if (snapshot.hasData) {
              return GridView.builder(
                // shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2.0,
                  crossAxisSpacing: 7.0,
                  childAspectRatio: 1.1,
                ),
                itemCount: categories!.length,
                itemBuilder: (ctx, index) {
                  return CategoryWidget(
                    category: categories[index],
                  );
                },
              );
            } else {
              return Text("Pas de categorie");
            }
          } else {
            return Text("Une erreur s'est produite");
          }
        },
      ),

      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: GridView.builder(
      //     // shrinkWrap: true,
      //     // physics: NeverScrollableScrollPhysics(),
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 2,
      //       mainAxisSpacing: 7.0,
      //       crossAxisSpacing: 7.0,
      //       childAspectRatio: 0.8,
      //     ),
      //     itemCount: 10,
      //     itemBuilder: (ctx, index) {
      //       return CategoryWidget();
      //     },
      //   ),
      // ),
    );
  }
}
