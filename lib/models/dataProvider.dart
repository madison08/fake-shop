import 'dart:convert';

import 'package:fake_store_app/models/Product.dart';
import 'package:fake_store_app/services/api_consts.dart';
import 'package:http/http.dart' as http;

import 'package:fake_store_app/services/api_handler.dart';
import 'package:flutter/widgets.dart';

class DataProvider with ChangeNotifier {
  List<Product>? _products = [];

  get allProducts {
    return _products;
  }

  Future<List<Product>?> getAllProducts() async {
    var response = await http.get(Uri.parse("$BASE_URL/api/v1/products"));

    var data = jsonDecode(response.body);

    print("DATA: $data");

    List<Product>? loadedProduct = [];

    for (var product in data) {
      loadedProduct.add(Product.fromJson(product));
    }

    _products = loadedProduct;

    notifyListeners();

    return _products;
  }
}
