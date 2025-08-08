// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterkart/core/utils/api_urls.dart';
import 'package:flutterkart/model/carousal_model.dart';
import 'package:http/http.dart' as http;

class HomeScreenProvider extends ChangeNotifier {
  int currentPage = 1;
  List<CarousalModel> carousalData = [];
  Future<void> loadHomeProducts() async {
    String url = ApiUrls.baseUrl.trim() + ApiUrls.loadHomeProduct.trim();
    final response = await http.get(Uri.parse(url));
    print(url);
    print(response.body);
    try {
      var result = jsonDecode(response.body);
      List<dynamic> decodedData = result["offers"]["items"];
      carousalData =
          decodedData.map((e) => CarousalModel.fromJason(e)).toList();
      print(carousalData.first.name);
    } catch (e) {
      print(e);
    }
  }

  Future<void> loadProducts() async {
    String url = ApiUrls.baseUrl.trim() +
        ApiUrls.loadProducts(shopid: 1, curPage: currentPage);

    try {
      final response = await http.get(Uri.parse(url));

      print(url);

      if (response.statusCode == 200) {
        
        print("Response body:");
        print(response.body);
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception occurred: $e");
    }
  }
}
