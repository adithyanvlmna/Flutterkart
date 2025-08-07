import 'package:flutter/material.dart';
import 'package:flutterkart/view/auth/login_view.dart';
import 'package:flutterkart/view/initial_view/welcome_view.dart';

Map<String, Widget Function(BuildContext context)> routes = {
  WelcomeView.routeName:(ctx)=> WelcomeView(),
  LoginView.routeName:(ctx)=> LoginView(),
};
