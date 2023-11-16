import 'package:donations/const/style.dart';
import 'package:donations/view/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const Logo());

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final controller = Get.put(Splash_Controller());
    return Scaffold(
      backgroundColor: K.primaryColor,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              width: 300,
              height: 400,
              child: Image.asset('asset/image/logo.png')),
          K.sizedBoxH,
          Container(
              width: 310,
              child: LinearProgressIndicator(
                minHeight: 2,
              ))
        ]),
      ),
    );
  }
}
