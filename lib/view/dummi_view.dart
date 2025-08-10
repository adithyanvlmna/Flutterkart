import 'package:flutter/material.dart';
import 'package:flutterkart/core/app_theme/app_color.dart';
import 'package:flutterkart/core/utils/internet_checker.dart';
import 'package:flutterkart/view/auth/login_view.dart';
import 'package:flutterkart/widgets/common_text_button.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DummiView extends StatelessWidget {
  const DummiView({super.key});

  @override
  Widget build(BuildContext context) {
    return ConnectivityWrapperWidget(
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/lottie/no_data.json"),
            CommonTextButton(
              onPressed: () async {
                final pref = await SharedPreferences.getInstance();
             await  pref.clear();
            Navigator.pushReplacementNamed(context, LoginView.routeName);
              },
              text: "Log Out ⬅",
            )
          ],
        ),
      ),
    );
  }
}
