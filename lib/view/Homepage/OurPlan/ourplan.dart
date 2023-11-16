import 'package:donations/const/strings.dart';
import 'package:donations/const/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const OurPlan());

class OurPlan extends StatelessWidget {
  const OurPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('our_plan'.tr),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              const SizedBox(height: 10),
              Text(Strings.charity,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: K.primaryColor)),
              K.sizedBoxH,
              Row(children: [
                Text('our_goal'.tr,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red)),
              ]),
              K.sizedBoxH,
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text('report_one'.tr,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: K.blackColor))),
              const Divider(height: 10, color: K.blackColor),
              Row(children: [
                Text('our_plan'.tr,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red)),
              ]),
              K.sizedBoxH,
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text('report_two'.tr,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: K.blackColor))),
            ])));
  }
}
