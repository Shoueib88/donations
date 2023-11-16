import 'package:get/get.dart';

class DetialsController extends GetxController {
  var currentindex = 0.obs;

  currentIndex(val) {
    currentindex.value = val;
    update();
  }
}
