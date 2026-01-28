import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hw_day8/models/product_model.dart';

class Api {
  String link = "https://dummyjson.com/products";
  Future<List<ProductModel>> getProducts() async {
    var uri = Uri.parse(link);
    var response = await http.get(uri);
    var result = jsonDecode(response.body);
    print(result);

    List<ProductModel> list = [];

    for (var item in result["products"]) {
      ProductModel c1 = ProductModel.fromJson(item);
      list.add(c1);
    }

    return list;
  }
}