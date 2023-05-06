import 'package:flutter/material.dart';
import '../constants/colors.dart';

RichText buildTermsAndCondition() {
    return RichText(
        textAlign: TextAlign.center,
        text:  TextSpan(
            style: TextStyle(
                color: greyColor,
                height: 1.2,
                fontSize: 15,
                fontWeight: FontWeight.w600),
            children: const [
              TextSpan(text: 'By continuing, I agree to the '),
              TextSpan(
                text: 'Terms of Servce ',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              TextSpan(text: 'and \n'),
              TextSpan(text: 'consent to the '),
              TextSpan(
                text: 'Privacy Policy',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ]));
  }
