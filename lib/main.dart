import 'package:donations/const/style.dart';
import 'package:donations/firebase_options.dart';
import 'package:donations/translation/translate.dart';
import 'package:donations/view/Homepage/home/home.dart';
import 'package:donations/view/Homepage/homescreen/Add_Location/controller/Map_Controller.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MapController());
    return GetMaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: K.primaryColor),
          appBarTheme: AppBarTheme(color: K.primaryColor)),
      debugShowCheckedModeBanner: false,
      translations: Translation(),
      locale: Locale('en'),
      fallbackLocale: Locale('en'),
      home: Directionality(textDirection: TextDirection.ltr, child: Logo()),
    );
  }
}
