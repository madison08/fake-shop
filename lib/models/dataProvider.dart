import 'dart:convert';
import 'dart:developer';

import 'package:fake_store_app/models/Category.dart';
import 'package:fake_store_app/models/Product.dart';
import 'package:fake_store_app/models/User.dart';
import 'package:fake_store_app/services/api_consts.dart';
import 'package:http/http.dart' as http;

import 'package:fake_store_app/services/api_handler.dart';
import 'package:flutter/widgets.dart';

class DataProvider with ChangeNotifier {
  List<Product>? _products = [];
  List<Category>? _categories = [];
  List<User>? _users = [];

  get allProducts {
    return _products;
  }

  get allCategory {
    return _categories;
  }

  get allUsers {
    return _users;
  }

  Future<List<Product>?> getAllProducts({limit = 5}) async {
    try {
      // final uri = Uri.https(BASE_URL, "/api/v1/products",  );

      int offset = 0;
      // int limit = 0;

      var response = await http.get(
          Uri.parse("$BASE_URL/api/v1/products?offset=$offset&limit=$limit"));

      var data = jsonDecode(response.body);

      print("DATA: $data");

      List<Product>? loadedProduct = [];

      if (response.statusCode != 200) {
        throw data["message"];
      }

      for (var product in data) {
        loadedProduct.add(Product.fromJson(product));
      }

      _products = loadedProduct;

      notifyListeners();

      return _products;
    } catch (err) {
      log("Erreur a la recuperation de produits $err");
      throw err.toString();
    }
  }

  Future<Product>? getSingleProduct(productID) async {
    var response =
        await http.get(Uri.parse("$BASE_URL/api/v1/products/$productID"));

    var data = jsonDecode(response.body);

    Product dataReturn = Product.fromJson(data);

    print("DATAL: $data");
    print("DATAL RETURN: $dataReturn");

    return dataReturn;
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

  Future<List<User>?> getAllUser() async {
    var response = await http.get(Uri.parse("$BASE_URL/api/v1/users"));

    var data = jsonDecode(response.body);

    print("DATA: $data");

    List<User>? loadedUser = [];

    for (var user in data) {
      loadedUser.add(User.fromJson(user));
    }

    _users = loadedUser;

    notifyListeners();

    return _users;
  }
}
