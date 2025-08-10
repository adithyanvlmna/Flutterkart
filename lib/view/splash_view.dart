import 'package:flutter/material.dart';
import 'package:flutterkart/core/utils/app_size.dart';
import 'package:flutterkart/view/auth/login_view.dart';
import 'package:flutterkart/view/bottom_nav_view.dart';
import 'package:flutterkart/view/initial_view/welcome_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SplashView extends StatefulWidget {
  static const String routeName = "splashView";
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  double scale = 0.0;

  @override
  void initState() {
    super.initState();

    // Start animation after a short delay
    Timer(const Duration(milliseconds: 200), () {
      setState(() {
        scale = 1.0;
      });
    });

    _navigateFromSplash();
  }

  Future<void> _navigateFromSplash() async {
    try {
      await Future.delayed(const Duration(seconds: 3));

      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("access_token");

      print("Retrieved token: $token");

      if (!mounted) return;

      if (token != null && token.isNotEmpty) {
        Navigator.pushReplacementNamed(context, BottomNavView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, WelcomeView.routeName);
      }
    } catch (e) {
      print("Error in splash navigation: $e");
      if (mounted) {
        Navigator.pushReplacementNamed(context, WelcomeView.routeName);
      }
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: screenHeight(context, 1),
        width: screenWidth(context, 1),
        child: Center(
          child: AnimatedScale(
            scale: scale,
            duration: const Duration(milliseconds: 800),
            curve: Curves.elasticOut,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), // Rounded like app icon
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                "assets/images/app_icon.png",
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
