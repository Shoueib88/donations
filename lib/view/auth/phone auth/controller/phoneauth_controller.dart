import 'package:donations/view/auth/services/auth_services.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneController extends GetxController {
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();
  final authservices = AuthServices();
  final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;

  verfyPhoneAuth() async {
    await authservices.verifyPhone('+20${phone.text}');
  }

  countrycodepicker() async {
    final code = await countryPicker.showPicker(context: Get.context!);
    countryCode = code;
    update();
  }
}
