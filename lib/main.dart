import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/constants/colors.dart';
import 'app/pages/splash_screen.dart';
import 'app/services/connectivity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
      apiKey: 'AIzaSyA4QqjGnnME3ufswAQZDA01EQ_TljmNXwc',
      appId: '1:504343416311:web:10499ba15b6055c57032f2',
      messagingSenderId: '504343416311',
      projectId: 'unisawap',
      authDomain: 'unisawap.firebaseapp.com',
      storageBucket: 'unisawap.appspot.com',
      measurementId: 'G-4YJ41NY8BR',
    ));
  } else {
    await Firebase.initializeApp();
  }
  // final networkController = Get.put(NetworkController());
  // networkController.listenToConnection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(iconTheme: IconThemeData(color: greyColor)),
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      home: SplashScreen(),
      navigatorObservers: [BotToastNavigatorObserver()],
      builder: BotToastInit(),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}
