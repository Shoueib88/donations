import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/appassets.dart';
import '../const/style.dart';
import '../view/Homepage/homescreen/Homescreen/controller/HomeScreenController.dart';

void main() => runApp(const CustomCarousel());

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    return Container(
      width: 355,
      height: 310,
      child: CarouselSlider.builder(
          carouselController: controller.ps,
          itemCount: listing.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
              decoration: K.boxDecoration,
              child: Image.asset(listing[index],
                  fit: BoxFit.cover, width: 345, height: 300),
            );
          },
          options: CarouselOptions(
              onPageChanged: (index, r) {
                controller.carourseloption(index);
              },
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              autoPlayCurve: Curves.easeIn,
              autoPlay: true,
              enableInfiniteScroll: true,
              aspectRatio: 0.7,
              viewportFraction: 1)),
    );
  }
}
