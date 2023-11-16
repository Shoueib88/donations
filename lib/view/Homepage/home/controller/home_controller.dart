import 'package:get/get.dart';

class HomeController extends GetxController {
  final currentindex = 0.obs;
  changecurrentindex(index) {
    currentindex.value = index;
    update();
  }
}
