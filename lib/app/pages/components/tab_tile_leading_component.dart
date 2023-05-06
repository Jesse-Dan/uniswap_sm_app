import 'package:flutter/material.dart';
import '../../constants/colors.dart';

Stack buildLeadingComponent({icon}) {
  return Stack(alignment: Alignment.center, children: [
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: pinkColor,
      ),
      height: 40,
      width: 40,
    ),
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: cardColor,
      ),
      height: 38,
      width: 38,
      child: Icon(
        icon,
        color: Colors.white,
        size: 25,
      ),
    )
  ]);
}
