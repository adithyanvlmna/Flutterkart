import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final otpformKey = GlobalKey<FormState>();
  TextEditingController emialController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  void onclear() {
    otpController.clear();
    passwordController.clear();
    emialController.clear();
  }
}
