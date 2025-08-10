import 'package:flutter/material.dart';
import 'package:flutterkart/controller/login_provider.dart';
import 'package:flutterkart/core/app_theme/app_color.dart';
import 'package:flutterkart/core/app_theme/app_styles.dart';
import 'package:flutterkart/core/utils/internet_checker.dart';
import 'package:flutterkart/core/utils/validator.dart';
import 'package:flutterkart/widgets/common_button.dart';
import 'package:flutterkart/widgets/common_texfield.dart';
import 'package:flutterkart/widgets/common_text_button.dart';
import 'package:provider/provider.dart';

class OtpView extends StatelessWidget {
  static const String routeName = "otpView";
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: SafeArea(
          child: ConnectivityWrapperWidget(
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Form(
                key: value.otpformKey,
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
                      "Enter the OTP code we sent to${value.emialController.text} Need to edit the email ",
                      style: AppStyles.normalText,
                    ),
                    Text(
                      "OTP",
                      style: AppStyles.normalText,
                    ),
                    CommonTexfield(
                        validator: (p0) => AppValidator.fieldValidation(p0, "OTP"),
                        hintText: "Enter your OTP",
                        controller: value.otpController),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonTextButton(onPressed: () {}, text: "Resend OTP"),
                        Text(
                          "in (00:16)",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                    CommonButton(
                        isLoad: value.isLoading,
                        onTap: () {
                          if (value.otpformKey.currentState!.validate()) {
                            value.verifyOtp(context);
                          }
                        },
                        buttonText: "Verify OTP"),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
