import 'package:fake_store_app/models/Category.dart';

class Product {
  int? id;
  String? title;
  num? price;
  String? description;
  Category? category;
  List<dynamic>? images;

  Product(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.images});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    images = json['images'] ?? ["https://via.placeholder.com/150"];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = {};
  //   data['id'] = id;
  //   data['title'] = title;
  //   data['price'] = price;
  //   data['description'] = description;
  //   if (category != null) {
  //     data['category'] = category!.toJson();
  //   }
  //   data['images'] = images;
  //   return data;
  // }
}
