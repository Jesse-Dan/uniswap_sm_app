import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';
import '../models/get_started_tabs_model.dart';

import 'components/tab_tile.dart';
import 'components/tab_tile_leading_component.dart';

class GetStartedScreen extends StatelessWidget {
  GetStartedScreen({super.key});
  final tabsList = tabs;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color.fromARGB(255, 131, 156, 169),
            size: 26,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'How do you want to get started?',
              textAlign: TextAlign.center,
              style: GoogleFonts.actor(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 25),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(10.0),
            itemCount: tabsList.length,
            itemBuilder: ((context, index) {
              var data = tabsList[index];
              return buildTabTile(
                  title: data.title,
                  subTitle: data.subtitle,
                  icon: data.icon,
                  onTap: data.onTap);
            }),
          ),
        ],
      ),
      bottomSheet: Container(
        color: bgColor,
        height: 70,
        width: size.width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              textAlign: TextAlign.center,
              'Restore from iCloud',
              style: GoogleFonts.actor(
                  color: pinkColor, fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
