import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/category_model.dart';
import '../model/product_model.dart';
import '../model/slider_model.dart';

class DataLayer {

  //Get Products
  Future<List<ProductModel>> fetchProducts() async {
    print("???");
    // Load JSON data from assets
    String jsonString =
        await rootBundle.loadString('assets/demo_data/demo_products.json');
    List<dynamic> jsonList = json.decode(jsonString);
    print("!!!");
    // Convert JSON to a list of Product objects
    List<ProductModel> products = jsonList
        .map((json) => ProductModel(
              id: json['id'],
              imgUrl: json['imgUrl'],
              name: json['name'],
              dsc: json['dsc'],
              price: json['price'].toDouble(),
            ))
        .toList();
    print("!!!");
    return products;
  }

  //Get Categories
  Future<List<CategoryModel>> fetchCategories() async {
    // Load JSON data from assets
    String jsonString = await rootBundle.loadString('assets/demo_data/demo_categories.json');
    List<dynamic> jsonList = json.decode(jsonString);

    // Convert JSON to a list of Category objects
    List<CategoryModel> categories = jsonList
        .map((json) => CategoryModel(
              id: json['id'],
              name: json['name'],
              imgUrl: json['imgUrl'],
            ))
        .toList();

    return categories;
  }

 //Get Sliders
  Future<List<SliderModel>> fetchSliders() async {
    String jsonString = await rootBundle.loadString('assets/demo_data/demo_sliders.json');
    List<dynamic> jsonList = json.decode(jsonString);

    List<SliderModel> sliders = jsonList.map((json) => SliderModel(
      id: json['id'],
      imgUrl: json['imgUrl'],
    )).toList();

    return sliders;
  }

}
