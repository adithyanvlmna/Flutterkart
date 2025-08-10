// ignore_for_file: avoid_print, prefer_final_fields

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterkart/core/utils/api_urls.dart';
import 'package:flutterkart/core/utils/enum.dart';
import 'package:flutterkart/model/carousal_model.dart';
import 'package:flutterkart/model/category_model.dart';
import 'package:flutterkart/model/product_model.dart';
import 'package:http/http.dart' as http;

class HomeScreenProvider extends ChangeNotifier {
  AppState _setDashBoardState = AppState.noError;
  AppState get setDashBoardState => _setDashBoardState;
  bool isLoadingMore = false;
  bool hasMoreData = true;
  int currentPage = 1;
  List<CarousalModel> carousalData = [];
  List<CategoryModel> categoryModel = [];
  List<ProductModel> productModel = [];
  TextEditingController searchController = TextEditingController();
  List<String> imgPath = [
    "assets/images/mobile_img.png",
    "assets/images/tv_img.jfif",
    "assets/images/fridge_img.jfif",
    "assets/images/shoes_img.jfif",
    "assets/images/tab_img.jfif",
    "assets/images/mac_img.jfif",
    "assets/images/dtop_img.jfif",
    "assets/images/ac_img.jfif",
    "assets/images/gift_img.jfif",
    "assets/images/remote_img.jfif"
  ];

  onDataClear() {
    isLoadingMore = false;
    hasMoreData = true;
    currentPage = 1;
    carousalData = [];
    categoryModel = [];
    productModel = [];
    searchController.clear();
    notifyListeners();
  }

  Future<void> loadHomeProducts() async {
    setDashBordState(AppState.loading);
    String url = ApiUrls.baseUrl.trim() + ApiUrls.loadHomeProduct.trim();
    final response = await http.get(Uri.parse(url));
    print(url);
    print(response.body);
    try {
      var result = jsonDecode(response.body);
      List<dynamic> carousalDat = result["offers"]["items"];
      List<dynamic> categoryData = result["categories"]["items"];
      carousalData =
          carousalDat.map((e) => CarousalModel.fromJason(e)).toList();
      categoryModel =
          categoryData.map((e) => CategoryModel.fromJson(e)).toList();
      notifyListeners();
      setDashBordState(AppState.success);
      print(carousalData.first.name);
      print(categoryModel.first.categoryName);
      print(carousalData.first.image);
    } catch (e) {
      setDashBordState(AppState.error);
      print(e);
    }
  }

  void setDashBordState(AppState newState) {
    _setDashBoardState = newState;
    notifyListeners();
  }

  Future<void> loadProducts() async {
    if (isLoadingMore || !hasMoreData) return;

    isLoadingMore = true;
    notifyListeners();

    String url = ApiUrls.baseUrl.trim() +
        ApiUrls.loadProducts(shopid: 1, curPage: currentPage);

    try {
      final response = await http.get(Uri.parse(url));

      print(url);

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        List<dynamic> decodedData = result["data"]["data"];

        if (decodedData.isEmpty) {
          hasMoreData = false;
        } else {
          productModel.addAll(
            decodedData.map((e) => ProductModel.fromJson(e)).toList(),
          );
          currentPage++;
        }
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception occurred: $e");
    } finally {
      isLoadingMore = false;
      notifyListeners();
    }
  }
}
