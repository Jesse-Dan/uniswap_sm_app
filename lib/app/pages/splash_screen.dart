import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'offloading_page.dart';
import '../constants/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _SplashScreenState() {
    Timer(const Duration(seconds: 5), () {
      Get.to(() => const OnboardingPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Align(
          alignment: Alignment.center,
          child: Image.asset('assets/background_img.png'),
        ),
      ),
    );
  }
}
