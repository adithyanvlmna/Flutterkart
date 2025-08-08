import 'package:flutter/material.dart';
import 'package:flutterkart/core/app_theme/app_color.dart';

class CommonTexfield extends StatefulWidget {
  final String? Function(String?)? validator;
  final TextInputType? keyboardtype;
  final String hintText;

  final TextEditingController controller;
  final bool? isObscure;
  const CommonTexfield(
      {super.key,
      required this.hintText,
      required this.controller,
      this.isObscure = false,
      this.keyboardtype = TextInputType.emailAddress,
      this.validator});

  @override
  State<CommonTexfield> createState() => _CommonTexfieldState();
}

class _CommonTexfieldState extends State<CommonTexfield> {
  late FocusNode _focusNode;
  bool? obscureText;
  @override
  void initState() {
    obscureText = widget.isObscure;
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border(Color color) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: color),
      );
    }

    return TextFormField(
      obscureText: obscureText!,
      focusNode: _focusNode,
      controller: widget.controller,
      cursorColor: AppColor.blackColor,
      keyboardType: widget.keyboardtype,
      style: TextStyle(color: AppColor.blackColor),
      validator: widget.validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 243, 242, 242),
        hintText: widget.hintText,
        hintStyle: TextStyle(
            color:
                _focusNode.hasFocus ? AppColor.blackColor : AppColor.greyColor),
        suffixIcon: widget.isObscure == true
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText!;
                  });
                },
                icon: obscureText == true
                    ? Icon(Icons.visibility,
                        color: _focusNode.hasFocus
                            ? AppColor.blackColor
                            : AppColor.greyColor)
                    : Icon(Icons.visibility_off,
                        color: _focusNode.hasFocus
                            ? AppColor.blackColor
                            : AppColor.greyColor))
            : null,
        focusedBorder: border(AppColor.blackColor),
        enabledBorder: border(AppColor.greyColor),
        errorBorder: border(Colors.red),
        focusedErrorBorder: border(Colors.red),
      ),
    );
  }
}
