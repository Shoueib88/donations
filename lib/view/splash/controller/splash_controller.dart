import 'dart:async';

import 'package:donations/view/auth/phone%20auth/phone_auth_screen.dart';
import 'package:get/get.dart';

class Splash_Controller extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Timer(Duration(seconds: 6), () {
      Get.offAll(AuthScreen());
    });
  }
}
