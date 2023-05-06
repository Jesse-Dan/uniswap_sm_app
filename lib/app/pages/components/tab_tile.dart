import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/colors.dart';
import 'tab_tile_leading_component.dart';

Padding buildTabTile({title, subTitle, icon, void Function()? onTap}) {
  return Padding(
    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
    child: ListTile(
      onTap:onTap,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20))),
      tileColor: cardColor,
      leading: buildLeadingComponent(icon: icon),
      contentPadding: const EdgeInsets.all(13),
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          title,
          style: GoogleFonts.actor(
              color: whiteColor, fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 5),
        child: Text(
          subTitle,
          style: GoogleFonts.actor(
              color: greyColor, fontWeight: FontWeight.w400, fontSize: 18),
        ),
      ),
    ),
  );
}
