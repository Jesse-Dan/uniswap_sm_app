import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';
import '../pages/get_started_page.dart';

Padding buildBtn(
    {required dynamic doThis, required String btnText, iserror = false}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
    child: GestureDetector(
      onTap: iserror ? null : doThis,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: iserror ? pinkColor.withOpacity(0.2) : pinkColor,
        ),
        child: Center(
            child: Text(
          textAlign: TextAlign.center,
          btnText,
          style: GoogleFonts.actor(
              color: iserror ? Colors.white.withOpacity(0.2) : Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20),
        )),
      ),
    ),
  );
}
