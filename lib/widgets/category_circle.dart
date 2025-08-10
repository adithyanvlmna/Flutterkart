import 'package:flutter/material.dart';
import 'package:flutterkart/core/app_theme/app_color.dart';
import 'package:flutterkart/core/utils/app_size.dart';

class CategoryCircle extends StatelessWidget {
  final String text;
  final String imgpath;
  const CategoryCircle({super.key, required this.text, required this.imgpath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 43,
            backgroundImage: AssetImage(imgpath),
          ),
          Text(
            text,
            style: TextStyle(
                color: AppColor.blackColor,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
