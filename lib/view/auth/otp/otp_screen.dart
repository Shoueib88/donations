import 'package:donations/const/style.dart';
import 'package:donations/view/auth/otp/controller/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const OtpScreen());

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OtpController());
    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
      child: Column(children: [
        const SizedBox(height: 80),
        Container(
          width: 250,
          height: 250,
          child: Image.asset('asset/image/otp1.png',
              color: K.primaryColor, fit: BoxFit.fill),
        ),
        K.sizedBoxH,
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...List.generate(
                  controller.listotp.length,
                  (index) => Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: K.boxDecoration,
                      child: TextFormField(
                          controller: controller.listotp[index],
                          decoration:
                              const InputDecoration(border: InputBorder.none))))
            ]),
        K.sizedBoxH,
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(K.primaryColor)),
            onPressed: () async {
              await controller.sendOtp();
              controller.setDataToFirestore();
            },
            child: const Text("Send")),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('we send massage.'),
            MaterialButton(
              onPressed: () {},
              child: Text('Send again',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              textColor: K.primaryColor,
            )
          ],
        )
      ]),
    )));
  }
}
