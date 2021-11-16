import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getx_api_app/model/configuration.dart';
import 'package:getx_api_app/model/product.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>> fetchProducts() async {
    http.Response response =
        await client.get(Uri.https("fakestoreapi.com", "/products/"));

    if (response.statusCode == 200) {
      var result = productFromJson(response.body);
      return result;
    } else {
      return [];
    }
  }


  // Loading from Assets

  static Future<List<Product>> fetchProductsFromAssets() async {
    String jsonString = await rootBundle.loadString("assets/products.json");

    var result = productFromJson(jsonString);
    return result;
  }

  static Future<List<Configuration>> fetchConfigurationFromAssets() async {
    String jsonString = await rootBundle.loadString("assets/config.json");

    var result = configurationFromJson(jsonString);
    return result;
  }
}
