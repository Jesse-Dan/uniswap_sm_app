import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uniswap_sm_app/app/pages/page_2.dart';
import 'package:uniswap_sm_app/app/pages/page_3.dart';
import '../pages/enter_recovery_phrase_page.dart';

class GetStartedTabs {
  final String title, subtitle;
  final IconData icon;
  final dynamic onTap;
  GetStartedTabs(
      {required this.title,
      required this.subtitle,
      required this.icon,
      required this.onTap});
}

List<GetStartedTabs> tabs = [
  GetStartedTabs(
      title: 'Import my wallet',
      subtitle: 'Enter your recovery phrase',
      icon: Icons.keyboard_alt_rounded,
      onTap: () => Get.to(() => EnterRecoverPraseScreen())),
  GetStartedTabs(
      title: 'Watch your wallet',
      subtitle: 'Try it out with any wallet',
      icon: Icons.remove_red_eye_rounded,
      onTap: () => Get.to(() => EnterRecoverPraseScreen2())),
  GetStartedTabs(
      title: 'Create a new wallet',
      subtitle: 'Start with a new recovery phrase',
      icon: Icons.edit_note,
      onTap: () => Get.to(() => EnterRecoverPraseScreen3())),
];
