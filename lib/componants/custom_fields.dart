import 'package:donations/const/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/Homepage/homescreen/Add_Location/Map_Screen.dart';
import '../view/Homepage/homescreen/additem/controller/additemcontroller.dart';

class feilds {
  static final controller = AddItemController();
  static fieldofaddress() {
    return Container(
        width: 350.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0), border: Border.all()),
        child: TextFormField(
            controller: controller.address.value,
            decoration: InputDecoration(
                border: InputBorder.none,
                label: Text('add address',
                    style: TextStyle(color: K.primaryColor)),
                prefixIcon: IconButton(
                    color: K.primaryColor,
                    onPressed: () {
                      Get.to(MapScreen());
                    },
                    icon: Icon(Icons.location_on_outlined)))));
  }

  static largetextfield(
      {required String text, required TextEditingController controller}) {
    return Container(
        height: 65,
        width: 350.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0), border: Border.all()),
        child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
                border: InputBorder.none,
                label: Text(text, style: TextStyle(color: K.primaryColor)))));
  }

  static smallfielddatetime(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 150.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all()),
            child: TextFormField(
                controller: controller.time,
                decoration: InputDecoration(
                    icon: IconButton(
                        onPressed: () async {
                          TimeOfDay? time = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                          if (time == null) return;
                          controller.time.text =
                              ('${time.hour} : ${time.minute}');
                          print('=====================================');
                          print(controller.time.text);
                        },
                        icon: Icon(
                          Icons.timer_sharp,
                          color: K.primaryColor,
                          size: 30,
                        )),
                    border: InputBorder.none))),
        const SizedBox(width: 40),
        Container(
            width: 150.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all()),
            child: TextFormField(
                controller: controller.date,
                decoration: InputDecoration(
                    icon: IconButton(
                        onPressed: () async {
                          DateTime? date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1400),
                              lastDate: DateTime(2100));
                          if (date == null) return;
                          controller.date.text =
                              ('${date.year}/${date.month}/${date.day}');

                          print('=====================================');
                          print(controller.date.text);
                        },
                        icon: Icon(
                          Icons.calendar_month,
                          color: K.primaryColor,
                          size: 30,
                        )),
                    border: InputBorder.none))),
      ],
    );
  }

  static bottons({required void Function() onpressed}) {
    return Container(
        height: 50,
        width: 150,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(K.primaryColor)),
            onPressed: onpressed,
            child: const Text('Submit')));
  }

  static smalltextfield(
      {required TextEditingController controller_apartment,
      required TextEditingController controller_marque}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 150.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all()),
            child: TextFormField(
                controller: controller_apartment,
                decoration: const InputDecoration(
                    hintText: '\t\tapartment', border: InputBorder.none))),
        const SizedBox(width: 40),
        Container(
            width: 150.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all()),
            child: TextFormField(
                controller: controller_marque,
                decoration: const InputDecoration(
                    hintText: '\t\tspecial marque', border: InputBorder.none))),
      ],
    );
  }
}
