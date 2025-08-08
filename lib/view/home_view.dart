import 'package:flutter/material.dart';
import 'package:flutterkart/controller/home_screen_provider.dart';
import 'package:flutterkart/controller/login_provider.dart';
import 'package:flutterkart/core/app_theme/app_color.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "homeview";
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      HomeScreenProvider provider =
          Provider.of<HomeScreenProvider>(context, listen: false);
      provider.loadHomeProducts();
     await provider.loadProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Column(),
    );
  }
}
