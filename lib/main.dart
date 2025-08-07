import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutterkart/routes.dart';
import 'package:flutterkart/view/initial_view/welcome_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ConnectivityAppWrapper(
      app: MaterialApp(
        initialRoute: WelcomeView.routeName,
        debugShowCheckedModeBanner: false,
        title: 'FlutterKart',
       routes: routes,
      ),
    );
  }
}
