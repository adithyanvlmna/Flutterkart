import 'package:flutter/material.dart';


class CommonTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color? color;
  const CommonTextButton(
      {super.key, required this.onPressed, required this.text,this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text,style: TextStyle(color:color??Colors.red ),),
    );
  }
}
