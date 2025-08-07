import 'package:flutter/material.dart';
import 'package:flutterkart/core/app_theme/app_color.dart';
import 'package:flutterkart/core/app_theme/app_styles.dart';
import 'package:flutterkart/core/utils/app_size.dart';
import 'package:flutterkart/core/utils/internet_checker.dart';
import 'package:flutterkart/view/auth/login_view.dart';

class WelcomeView extends StatefulWidget {
  static const String routeName = "welcomeView";
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  int currentScreen = 0;
  @override
  Widget build(BuildContext context) {
    return ConnectivityWrapperWidget(
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (currentScreen == 0)
                bodyContent("Welcome to ecom", "assets/images/welcome_img.png"),
              if (currentScreen == 1)
                bodyContent(
                    "Lorem Ipsum is simply dummy\n     text of the printing !",
                    "assets/images/Illustration.png"),
              if (currentScreen == 2)
                bodyContent(
                    "It is a long established fact\n      that a reader will !",
                    "assets/images/content_img.png"),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Lorem Ipsum is simply dummy text of the \n          printing and typesetting !",
                    style: TextStyle(
                      color: AppColor.greyColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight(context, 6),
              ),
              bottom(),
            ],
          ),
        ),
      ),
    );
  }

  Widget bodyContent(String text, String imgPath) {
    return Column(
      children: [
        Image.asset(
          imgPath,
          height: screenHeight(
            context,
            3,
          ),
          width: screenWidth(context, 1),
        ),
        Center(
          child: Text(
            text,
            style: AppStyles.primaryText,
          ),
        )
      ],
    );
  }

  Widget bottom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, LoginView.routeName);
            },
            child: Text(
              "Skip",
              style: TextStyle(
                  color: AppColor.greyColor, fontWeight: FontWeight.bold),
            )),
        SizedBox(
          width: 60,
          child: Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentScreen == 0
                      ? AppColor.blackColor
                      : AppColor.greyColor,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentScreen == 1
                      ? AppColor.blackColor
                      : AppColor.greyColor,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentScreen == 2
                      ? AppColor.blackColor
                      : AppColor.greyColor,
                ),
              )
            ],
          ),
        ),
        TextButton(
            onPressed: () {
              setState(() {
                if(currentScreen<=1){
                  currentScreen++;
                }
                else {
                  Navigator.pushNamed(context, LoginView.routeName);
                  currentScreen == 0;
                }
              });
            },
            child: Text(
              "Next",
              style: TextStyle(
                  color: AppColor.blackColor, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
