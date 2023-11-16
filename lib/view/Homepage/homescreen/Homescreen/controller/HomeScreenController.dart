import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final currentindex = 0.obs;
  CarouselController ps = CarouselController();

  carourseloption(index) {
    currentindex.value = index;
  }
}
