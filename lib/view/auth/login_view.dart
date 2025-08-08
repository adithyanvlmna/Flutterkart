import 'package:flutter/material.dart';
import 'package:flutterkart/controller/login_provider.dart';
import 'package:flutterkart/core/app_theme/app_color.dart';
import 'package:flutterkart/core/app_theme/app_styles.dart';
import 'package:flutterkart/core/utils/app_size.dart';
import 'package:flutterkart/core/utils/validator.dart';
import 'package:flutterkart/view/auth/otp_view.dart';
import 'package:flutterkart/view/auth/resgister_view.dart';
import 'package:flutterkart/widgets/common_button.dart';
import 'package:flutterkart/widgets/common_texfield.dart';
import 'package:flutterkart/widgets/common_text_button.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  static const String routeName = "loginView";
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Form(
            key: value.formKey,
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Sign in to your \nAccount",
                  style: AppStyles.loginText,
                ),
                Text(
                  "Enter your email and password to log in",
                  style: AppStyles.normalText,
                ),
                Text(
                  "Email",
                  style: AppStyles.normalText,
                ),
                CommonTexfield(
                    validator: (p0) =>
                        AppValidator.fieldValidation(p0, "Email"),
                    hintText: "Enter your email",
                    controller: value.emialController),
                Text(
                  "Password",
                  style: AppStyles.normalText,
                ),
                CommonTexfield(
                    validator: (p0) =>
                        AppValidator.fieldValidation(p0, "Password"),
                    isObscure: true,
                    hintText: "Enter your Password",
                    controller: value.passwordController),
                Align(
                  alignment: Alignment.centerRight,
                  child: CommonTextButton(
                      onPressed: () {}, text: "Forgot Password ?"),
                ),
                CommonButton(
                    onTap: () {
                      if (value.formKey.currentState!.validate()) {
                        value.loginUser(context);
                      }
                    },
                    buttonText: "Log In"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    Expanded(
                        child: Container(
                      color: AppColor.greyColor,
                      height: 1,
                    )),
                    Text(
                      "Or",
                      style: TextStyle(color: AppColor.greyColor),
                    ),
                    Expanded(
                        child: Container(
                      color: AppColor.greyColor,
                      height: 1,
                    ))
                  ],
                ),
                custonButton(
                    context, "Login wIth OTP", "assets/images/otp_img.png", () {
                  value.getOtp(context);
                  
                }),
                custonButton(context, "Continue with Google",
                    "assets/images/google_img.png", () {}),
                custonButton(context, "Continue with Facebook",
                    "assets/images/fb_img.png", () {}),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t have an account?"),
                    CommonTextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, ResgisterView.routeName);
                        },
                        text: "Sign Up")
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget custonButton(context, String text, String imgPath, Function()? onTap) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: screenWidth(context, 1),
          height: 50,
          decoration: BoxDecoration(
              color: AppColor.whiteColor,
              border: Border.all(color: AppColor.greyColor),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3))
              ]),
          child: Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imgPath,
                height: 20,
              ),
              Text(
                text,
                style: TextStyle(
                    color: AppColor.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              )
            ],
          ),
        ));
  }
}
