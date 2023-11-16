import 'package:donations/view/auth/phone%20auth/controller/phoneauth_controller.dart';
import 'package:donations/view/auth/services/getDataservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../model/user_token.dart';
import '../../services/auth_services.dart';

class OtpController extends GetxController {
  TextEditingController id = TextEditingController();
  final authservices = AuthServices();
  final phonecontroller = Get.put(PhoneController());
  final auth = FirebaseAuth.instance;
  final loading = false.obs;

  setDataToFirestore() async {
    await authservices.setDatatoFirestore(UserModel(
      phone: phonecontroller.phone.text,
      name: phonecontroller.name.text,
      id: otpstring.value,
      deviceToken: auth.currentUser?.uid,
    ));
  }

  List<UserModel> listofuser = <UserModel>[].obs;
  getData() async {
    loading.value = true;
    try {
      final data = await GetUserInfoService().getDat();
      print(data);

      listofuser.assignAll(data);

      loading.value = false;
    } catch (e) {
      print(e);
    }
  }

  List<TextEditingController> listotp = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  var otpstring = ''.obs;

  sendOtp() async {
    for (TextEditingController controller in listotp) {
      otpstring.value += controller.text;
    }
    print('========= $otpstring');
    await authservices.sendOtp(otpstring.value);
  }

  @override
  void onInit() {
    phonecontroller.verfyPhoneAuth();
    super.onInit();
  }
}
