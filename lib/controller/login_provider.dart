// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterkart/core/utils/api_urls.dart';
import 'package:flutterkart/core/utils/snackbar_helper.dart';
import 'package:flutterkart/model/user_model.dart';
import 'package:flutterkart/view/auth/login_view.dart';
import 'package:flutterkart/view/auth/otp_view.dart';
import 'package:flutterkart/view/bottom_nav_view.dart';
import 'package:flutterkart/view/home_view.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoadingMore = false;
  bool hasMoreData = true;
  UserModel? userdata;
  bool isLoading = false;
  final regformKey = GlobalKey<FormState>();
   final formKey = GlobalKey<FormState>();
   final otpformKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emialController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  void onLogindataclear() {
    passwordController.clear();
    emialController.clear();
    notifyListeners();
    isLoad(false);
  }

  void onOtpdataclear() {
    otpController.clear();
    emialController.clear();
    isLoad(false);
    notifyListeners();
  }

  void onregisterViewclear() {
    nameController.clear();
    phoneController.clear();
    idController.clear();
    isLoad(false);
    notifyListeners();
  }

  Future<void> loginUser(context) async {
    isLoad(true);
    final pref = await SharedPreferences.getInstance();
    String url = ApiUrls.baseUrl.trim() + ApiUrls.loginUrl.trim();
    final response = await http.post(Uri.parse(url), body: {
      "email": emialController.text.trim(),
      "password": passwordController.text.trim()
    });
    print(url);
    print(response.body);
    try {
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        if (result["status"] == true) {
          isLoad(false);
          Map<String, dynamic> userDate = result["user"];
          print(userDate);
          userdata = UserModel.fromJson(userDate);
          print(userdata?.email);
          await pref.setString("access_token", result["access_token"]);
          Navigator.pushNamed(context, BottomNavView.routeName);
          showSnackbar(
              msg: result["message"], color: Colors.green, context: context);
          onLogindataclear();
        } else {
          isLoad(false);
          showSnackbar(
              msg: result["message"], color: Colors.red, context: context);
        }
      }
    } catch (e) {
      isLoad(false);
      print(e);
      showSnackbar(msg: e.toString(), color: Colors.red, context: context);
    } finally {
      isLoad(false);
    }
  }

  Future<void> getOtp(context) async {
    if (emialController.text.isEmpty) {
      showSnackbar(
          msg: "Please enter the email", color: Colors.blue, context: context);
    }

    String url = ApiUrls.baseUrl.trim() + ApiUrls.otpUrl.trim();
    final response = await http.post(Uri.parse(url), body: {
      "email": emialController.text.trim(),
    });
    print(url);
    print(response.body);
    try {
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        if (result["status"] == true) {
          showSnackbar(
              msg: result["otp"].toString(),
              color: Colors.green,
              context: context);
          Navigator.pushNamed(context, OtpView.routeName);
        } else {
          showSnackbar(
              msg: result["message"], color: Colors.red, context: context);
        }
      }
    } catch (e) {
      print(e);
      showSnackbar(msg: e.toString(), color: Colors.red, context: context);
    }
  }

  Future<void> verifyOtp(context) async {
    isLoad(true);
    print("----------------${emialController.text.trim()}");
    print("----------------${otpController.text.trim()}");
    final pref = await SharedPreferences.getInstance();
    String url = ApiUrls.baseUrl.trim() + ApiUrls.verifyotpUrl.trim();
    print(url);
    final response = await http.post(Uri.parse(url), body: {
      "email": emialController.text.trim(),
      "otp": otpController.text.trim(),
    });
    print("----------------${emialController.text.trim()}");
    print("----------------${otpController.text.trim()}");
    print(response.body);
    try {
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        if (result["status"] == true) {
          isLoad(false);
          Map<String, dynamic> userDate = result["user"];
          print(userDate);
          userdata = UserModel.fromJson(userDate);
          print(userdata?.email);
          await pref.setString("access_token", result["access_token"]);
          onOtpdataclear();
          Navigator.pushNamed(context, HomeView.routeName);
          showSnackbar(
              msg: result["message"], color: Colors.green, context: context);
          onLogindataclear();
        } else {
          isLoad(false);
          showSnackbar(
              msg: result["message"], color: Colors.red, context: context);
        }
      }
    } catch (e) {
      isLoad(false);
      print(e);
      showSnackbar(msg: e.toString(), color: Colors.red, context: context);
    } finally {
      isLoad(false);
    }
  }

  Future<void> registerUser(context) async {
    isLoad(true);
    String url = ApiUrls.baseUrl.trim() + ApiUrls.registerUrl.trim();
    final response = await http.post(Uri.parse(url), body: {
      "name": nameController.text.trim(),
      "email": emialController.text.trim(),
      "password": passwordController.text.trim(),
      "shop_id": idController.text.trim(),
      "phone_number": phoneController.text.trim()
    });
    print(url);
    print(response.body);
    print(response.statusCode);
    try {
      var result = jsonDecode(response.body);
      if (result["status"]) {
        isLoad(false);
        showSnackbar(
            msg: result["message"], color: Colors.green, context: context);
        Navigator.pop(context);
        onregisterViewclear();
      } else {
        isLoad(false);
        showSnackbar(
            msg: result["message"], color: Colors.red, context: context);
      }
    } catch (e) {
      isLoad(false);
      showSnackbar(msg: e.toString(), color: Colors.red, context: context);
    } finally {
      isLoad(false);
    }
  }

  void isLoad(bool newState) {
    isLoading = newState;
    notifyListeners();
  }
}
