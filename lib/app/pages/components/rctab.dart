import 'package:flutter/material.dart';

import '../../constants/colors.dart';

Row buildRecoveryPhraseList() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: whiteColor,
        ),
        height: 4,
        width: 40,
      ),
      const SizedBox(
        width: 10,
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: darkerGreyColor,
        ),
        height: 4,
        width: 40,
      ),
      const SizedBox(
        width: 10,
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: darkerGreyColor,
        ),
        height: 4,
        width: 40,
      ),
      const SizedBox(
        width: 10,
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: darkerGreyColor,
        ),
        height: 4,
        width: 40,
      ),
    ],
  );
}
