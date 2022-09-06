import 'package:fake_store_app/constants.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
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
        centerTitle: true,
        title: Text(
          "Utilisateurs",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return ListTile(
              leading: FancyShimmerImage(
                height: 50.0,
                width: 50.0,
                errorWidget: Icon(
                  IconlyBold.danger,
                ),
                imageUrl: "https://i.ibb.co/vLBDKCM/DIMd-JND1-400x400.jpg",
                boxFit: BoxFit.fill,
              ),
              title: Text("Quincy Larsson"),
              subtitle: Text("devdev@gmail.com"),
              trailing: Text(
                "admin",
                style: TextStyle(
                  color: ColorManager.kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }),
    );
  }
}
