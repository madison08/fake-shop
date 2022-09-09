import 'dart:convert';

import 'package:fake_store_app/models/Category.dart';
import 'package:fake_store_app/models/Product.dart';
import 'package:fake_store_app/services/api_consts.dart';
import 'package:http/http.dart' as http;

import 'package:fake_store_app/services/api_handler.dart';
import 'package:flutter/widgets.dart';

class DataProvider with ChangeNotifier {
  List<Product>? _products = [];
  List<Category>? _categories = [];

  get allProducts {
    return _products;
  }

  get allCategory {
    return _categories;
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

  Future<List<Category>?> getAllCategories() async {
    var response = await http.get(Uri.parse("$BASE_URL/api/v1/categories"));

    var data = jsonDecode(response.body);

    print("DATA: $data");

    List<Category>? loadedCategory = [];

    for (var category in data) {
      loadedCategory.add(Category.fromJson(category));
    }

    _categories = loadedCategory;

    notifyListeners();

    return _categories;
  }
}
