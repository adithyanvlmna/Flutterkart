import 'package:flutter/material.dart';
import 'package:flutterkart/core/app_theme/app_color.dart';
import 'package:flutterkart/core/utils/internet_checker.dart';
import 'package:flutterkart/view/dummi_view.dart';
import 'package:flutterkart/view/home_view.dart';

class BottomNavView extends StatefulWidget {
  static const String routeName = "bottomNavView";
  const BottomNavView({super.key});

  @override
  State<BottomNavView> createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  int indexNum = 0;
  List<Widget> screens = [
    HomeView(),
    DummiView(),
    DummiView(),
    DummiView(),
    DummiView(),
  ];
  @override
  Widget build(BuildContext context) {
    return ConnectivityWrapperWidget(
      child: Scaffold(
        body: screens.elementAt(indexNum),
       bottomNavigationBar: BottomAppBar(
        color: AppColor.whiteColor,
        child: Container(
      height: kBottomNavigationBarHeight,
      color: AppColor.whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, 
        children: [
          navbarButton(0, Icons.home_outlined, "Home"),
          navbarButton(1, Icons.category, "Categories"),
          navbarButton(2, Icons.card_giftcard, "Offers"),
          navbarButton(3, Icons.shop, "Cart"),
          navbarButton(4, Icons.person, "Profile"),
        ],
      ),
        ),
      ),
      
      ),
    );
  }
Widget navbarButton(int index, IconData icon, String text) {
  final isColor = index == indexNum;
  return GestureDetector(
    onTap: () {
      setState(() {
        indexNum = index;
      });
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center, 
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isColor ? AppColor.buttonLightColor : AppColor.blackColor,
        ),
        Text(
          text,
          style: TextStyle(
            color: isColor
                ? AppColor.buttonLightColor
                : AppColor.blackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}


}
