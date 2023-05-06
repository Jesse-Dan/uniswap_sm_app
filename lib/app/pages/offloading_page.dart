import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'get_started_page.dart';
import '../constants/colors.dart';
import '../widget/btn.dart';
import '../widget/terms_and_condition.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
          child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              'assets/onboarding_img.png',
              height: 270,
              width: 270,
            ),
            const SizedBox(
              height: 30,
            ),
            const Center(
                child: Text(
              textAlign: TextAlign.center,
              'The best way\n to swap',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            )),
            SizedBox(
              height: size.height / 10,
            ),
            buildBtn(
                doThis: () {
                  Get.to(() => GetStartedScreen());
                },
                btnText: 'Get Started'),
            SizedBox(
              height: size.height / 30,
            ),
            buildTermsAndCondition(),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      )),
    );
  }
}
