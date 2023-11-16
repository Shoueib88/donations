import 'package:donations/componants/DeleteAcount.dart';
import 'package:donations/componants/custom_containers.dart';
import 'package:donations/componants/translation_dialog.dart';
import 'package:donations/const/strings.dart';
import 'package:donations/const/style.dart';
import 'package:donations/view/Homepage/connectscreen/controller/ConnectController.dart';
import 'package:donations/view/feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const ConnectScreen());

class ConnectScreen extends StatelessWidget {
  const ConnectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ConnectController());
    return Scaffold(
      appBar: AppBar(
          title: Text('contact'.tr),
          centerTitle: true,
          actions: [TranslateDialog()]),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: K.primaryColor,
          onPressed: () {
            showDialog(
                context: context, builder: (context) => FeedbackDialog());
          },
          label: Text('Feedback')),
      body: SingleChildScrollView(
        child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 25),
              Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(children: [
                    Text('enterphone'.tr, style: TextStyle(fontSize: 18))
                  ])),
              CustomContainer.custContainer(
                  text: Strings.phone1,
                  icon: K.phoneicon,
                  onTap: () async {
                    await controller.urltelephone(Strings.phone1);
                  }),
              CustomContainer.custContainer(
                  text: Strings.phone2,
                  icon: K.phoneicon,
                  onTap: () async {
                    await controller.urltelephone(Strings.phone2);
                  }),
              CustomContainer.custContainer(
                  text: Strings.phone3,
                  icon: K.phoneicon,
                  onTap: () async {
                    await controller.urltelephone(Strings.phone3);
                  }),
              Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(children: [
                    Text('socials'.tr, style: TextStyle(fontSize: 18))
                  ])),
              CustomContainer.custContainer(
                  text: Strings.email,
                  icon: K.emailicon,
                  onTap: () async {
                    await controller.urlEmail();
                  }),
              CustomContainer.custContainer(
                  text: Strings.facebook,
                  icon: K.faceicon,
                  onTap: () async {
                    await controller.urlsocial(url['face']);
                  }),
              CustomContainer.custContainer(
                  text: Strings.instgram,
                  icon: K.instgramicon,
                  onTap: () async {
                    await controller.urlsocial(url['insta']);
                  }),
              CustomContainer.custContainer(
                  text: Strings.twitter,
                  icon: K.twitter,
                  onTap: () async {
                    await controller.urlsocial(url['twitt']);
                  }),
              DeleteAcount()
            ]),
      ),
    );
  }
}
