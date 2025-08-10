import 'package:flutter/material.dart';
import 'package:flutterkart/core/app_theme/app_color.dart';

class CommonButton extends StatelessWidget {
  final String buttonText;
  final Function()? onTap;
  final bool? isLoad;
  const CommonButton(
      {super.key,
      required this.onTap,
      required this.buttonText,
      this.isLoad = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [AppColor.buttonLightColor, AppColor.buttonDarkColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ]),
        child: isLoad == true
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColor.whiteColor,
                ),
              )
            : Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                      color: AppColor.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
      ),
    );
  }
}
