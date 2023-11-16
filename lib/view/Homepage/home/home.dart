import 'package:donations/const/appassets.dart';
import 'package:donations/view/Homepage/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../componants/custom_bottomnavbar.dart';
import '../../../const/style.dart';
import '../../../data.dart';
import '../../../helper/connectivity.dart';

void main() => runApp(const Home());

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final connectioncontroller = Get.put(ConnectionStatusSingleton());
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return CustomBottomNavBar(
            currentIndex: controller.currentindex.value,
            onTap: (val) {
              controller.changecurrentindex(val);
            },
            list: bottomNavigationBarData);
      }),
      body: Obx(() => connectioncontroller.connectivity.value == 0
          ? Container(
              width: double.infinity,
              height: double.infinity,
              color: K.primaryColor,
              child: Center(
                  child:
                      Image.asset(AppAssets.connectivity, color: K.mainColor)))
          : listOfScreen.elementAt(controller.currentindex.value)),
    );
  }
}
