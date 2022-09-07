import 'dart:convert';

import 'package:fake_store_app/models/Product.dart';
import 'package:fake_store_app/services/api_consts.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class APIHandler {
  List<Product> products = [];

  // static const baseUrl = "https://api.escuelajs.co/api/v1";

  //  Future<void> getAllProducts() async {
  //   var response = await http.get(Uri.parse("$BASE_URL/api/v1/products"));

  //   var data = jsonDecode(response.body);

  //   print("rsponse ${jsonDecode(response.body)}");

  //   List loadedData = [];

  //   for (var product in data) {
  //     loadedData.add(Product.fromJson(product));
  //     print(product);
  //   }

  //   // products = loadedData;
  // }
}
