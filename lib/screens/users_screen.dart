import 'package:fake_store_app/constants.dart';
import 'package:fake_store_app/models/User.dart';
import 'package:fake_store_app/models/dataProvider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

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
      body: FutureBuilder<dynamic>(
        future: Provider.of<DataProvider>(context, listen: false).getAllUser(),
        builder: (context, AsyncSnapshot snapshot) {
          print("future builder data: ${snapshot.data}");

          List<User>? users = snapshot.data;

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Quelque chose s'est mal passer");
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: users!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: FancyShimmerImage(
                        height: 50.0,
                        width: 50.0,
                        errorWidget: Icon(
                          IconlyBold.danger,
                        ),
                        imageUrl: users[index].avatar.toString(),
                        boxFit: BoxFit.fill,
                      ),
                      title: Text(users[index].name.toString()),
                      subtitle: Text(users[index].email.toString()),
                      trailing: Text(
                        users[index].role.toString(),
                        style: TextStyle(
                          color: ColorManager.kPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  });
            } else {
              return Text("Pas d'utilisateur");
            }
          } else {
            return Text("Une erreur s'est produite");
          }
        },
      ),
    );
  }
}
