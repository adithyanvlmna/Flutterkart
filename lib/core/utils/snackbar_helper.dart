import 'package:flutter/material.dart';
import 'package:flutterkart/core/app_theme/app_color.dart';

void showSnackbar({required String msg, Color? color,context}){
 ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: color??AppColor.blackColor,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
}