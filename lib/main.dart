import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutterkart/controller/home_screen_provider.dart';
import 'package:flutterkart/controller/login_provider.dart';
import 'package:flutterkart/routes.dart';
import 'package:flutterkart/view/bottom_nav_view.dart';
import 'package:flutterkart/view/home_view.dart';
import 'package:flutterkart/view/initial_view/welcome_view.dart';
import 'package:flutterkart/view/splash_view.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (ctx)=> LoginProvider()),
    ChangeNotifierProvider(create: (ctx)=> HomeScreenProvider())],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ConnectivityAppWrapper(
      app: MaterialApp(
        initialRoute: SplashView.routeName,
        debugShowCheckedModeBanner: false,
        title: 'FlutterKart',
       routes: routes,
      ),
    );
  }
}
