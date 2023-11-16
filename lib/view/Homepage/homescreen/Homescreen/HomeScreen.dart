import 'package:donations/componants/custom_carousel.dart';
import 'package:donations/const/appassets.dart';
import 'package:donations/const/style.dart';
import 'package:donations/view/Homepage/homescreen/Homescreen/controller/HomeScreenController.dart';
import 'package:donations/view/Homepage/homescreen/additem/additem_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() => runApp(const HomeScreen());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AppAssets.charity,
                  width: 100, height: 100, fit: BoxFit.fill),
              Image.asset(AppAssets.logo_green,
                  width: 100, height: 140, fit: BoxFit.fill)
            ],
          )),
      CustomCarousel(),
      Container(
          margin: const EdgeInsets.only(top: 10),
          child: Obx(() => SmoothPageIndicator(
              controller:
                  PageController(initialPage: controller.currentindex.value),
              count: listing.length,
              effect: ExpandingDotsEffect(
                  activeDotColor: K.primaryColor,
                  dotColor: K.primaryColor,
                  radius: 18)))),
      const SizedBox(height: 35),
      Container(
          decoration: K.boxDecorationwithcolor(color: K.primaryColor),
          width: 380,
          height: 70,
          child: MaterialButton(
              onPressed: () {
                Get.to(AddItem());
              },
              child: Text('donate_clothes'.tr, style: TextStyle(fontSize: 25)),
              textColor: K.whiteColor))
    ])));
  }
}
