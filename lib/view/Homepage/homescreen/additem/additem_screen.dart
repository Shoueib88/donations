import 'dart:io';
import 'package:donations/componants/custom_bottomsheet.dart';
import 'package:donations/componants/custom_fields.dart';
import 'package:donations/view/Homepage/homescreen/AddItem/controller/AddItemcontroller.dart';
import 'package:donations/view/Homepage/homescreen/additem/controller/addimage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/home.dart';

class AddItem extends StatelessWidget {
  const AddItem({super.key});

  @override
  Widget build(BuildContext context) {
    final itemcontroller = Get.put(AddItemController());
    final imagecontroller = Get.put(AddImageController());
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 360.0,
                  height: 310.0,
                  margin: const EdgeInsets.symmetric(horizontal: 7),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(border: Border.all()),
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GetBuilder(
                              init: AddImageController(),
                              builder: (controller) {
                                return Container(
                                    width: 380,
                                    height: 240,
                                    child:
                                        controller.fileimage.value.path.isEmpty
                                            ? Image.asset(
                                                'asset/image/addimage.png',
                                                fit: BoxFit.contain)
                                            : Image.file(
                                                File(controller.fileimage.value
                                                    .toString()),
                                                fit: BoxFit.fill));
                              }),
                          const SizedBox(height: 2),
                          CustomBottomSheet().Bottom_Sheet(context)
                        ]),
                  )),
              const SizedBox(height: 20),
              feilds.largetextfield(
                  text: 'number of pieces', controller: itemcontroller.pieces),
              const SizedBox(height: 20),
              Obx(() => feilds.fieldofaddress()),
              const SizedBox(height: 20),
              feilds.smallfielddatetime(context),
              const SizedBox(height: 20),
              feilds.bottons(
                onpressed: () async {
                  await itemcontroller.dataUpLoad(
                      imagecontroller.fileimage.value,
                      itemcontroller.pieces.text,
                      itemcontroller.date.text,
                      itemcontroller.time.text,
                      itemcontroller.specialmarque.text,
                      itemcontroller.apartmentnum.text);
                  Get.offAll(Home());
                },
              )
            ],
          ),
        ));
  }
}
