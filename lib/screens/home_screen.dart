import 'package:card_swiper/card_swiper.dart';
import 'package:fake_store_app/constants.dart';
import 'package:fake_store_app/screens/feed_screen.dart';
import 'package:fake_store_app/widgets/carroussel_widget.dart';
import 'package:fake_store_app/widgets/feed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var _deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
        leading: Icon(
          IconlyLight.category,
          color: ColorManager.kPrimaryColor,
        ),
        title: Text(
          "Acceuil",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          Icon(
            IconlyLight.user2,
            color: ColorManager.kPrimaryColor,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10.0,
            ),
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                fillColor: Colors.white,
                filled: true,
                hintText: "Rechercher",
                suffixIcon: Icon(
                  IconlyLight.search,
                  color: ColorManager.kPrimaryColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.kPrimaryColor,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: _deviceHeight * 0.2,
                    child: Swiper(
                      autoplay: true,
                      itemCount: 3,
                      itemBuilder: (ctx, index) {
                        return CarrousselWidget();
                      },
                      pagination: SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                          activeColor: ColorManager.kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Tous les produits",
                          style: TextStyle(
                            fontSize: 15.5,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              PageTransition(
                                type: PageTransitionType.bottomToTop,
                                child: const FeedsScreen(),
                                childCurrent: widget,
                                ctx: context,
                              ),
                            );
                            // Navigator.push(
                            //   context,
                            //   PageTransition(
                            //     child: FeedsScreen(),
                            //     type: PageTransitionType.bottomToTop,
                            //     childCurrent: widget,
                            //     ctx: context,
                            //   ),
                            // );
                          },
                          child: Icon(
                            IconlyBold.arrowRight2,
                            color: ColorManager.kPrimaryColor,
                            size: 35.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  FeedsWidget()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
