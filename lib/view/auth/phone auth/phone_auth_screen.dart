import 'package:donations/const/style.dart';
import 'package:donations/view/auth/phone%20auth/controller/phoneauth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const AuthScreen());

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PhoneController());
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: EdgeInsets.only(top: 30),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Container(
                width: 280,
                height: 270,
                child: Image.asset('asset/image/donation.png',
                    fit: BoxFit.cover, color: K.primaryColor)),
            K.sizedBoxH,
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: controller.phone,
                  keyboardType: TextInputType.phone,
                  maxLines: 1,
                  decoration: InputDecoration(
                    focusColor: K.primaryColor,
                    prefixIcon: Padding(
                        padding: EdgeInsets.all(5),
                        child: GetBuilder(
                            init: PhoneController(),
                            builder: (col) {
                              return GestureDetector(
                                onTap: () {
                                  col.countrycodepicker();
                                },
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                          child: col.countryCode != null
                                              ? col.countryCode!
                                                  .flagImage(fit: BoxFit.fill)
                                              : null),
                                      const SizedBox(width: 5),
                                      Text(col.countryCode?.dialCode ?? '+1',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ))
                                    ]),
                              );
                            })),
                    hintText: 'phone number',
                  ),
                )),
            K.sizedBoxH,
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: controller.name,
                  decoration: InputDecoration(
                    focusColor: K.primaryColor,
                    prefixIcon: Icon(Icons.person),
                    hintText: 'name',
                  ),
                )),
            K.sizedBoxH,
            Container(
                width: 260,
                height: 60,
                decoration: K.boxDecorationwithcolor(color: K.primaryColor),
                child: MaterialButton(
                    onPressed: () {
                      controller.verfyPhoneAuth();
                    },
                    child: const Text("Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: K.whiteColor)))),
          ]),
    )));
  }
}
