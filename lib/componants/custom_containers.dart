import 'package:flutter/material.dart';

import '../const/style.dart';

class CustomContainer {
  static custContainer(
      {required String text,
      required IconData icon,
      required Function() onTap}) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.symmetric(vertical: 5),
            height: 40,
            width: 370,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                //border: Border.all(),
                color: K.whiteColor,
                boxShadow: const [
                  BoxShadow(blurRadius: 3, offset: Offset(2, 2))
                ]),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, color: K.primaryColor, size: 24),
                  K.sizedBoxW,
                  Text(text, style: const TextStyle(fontSize: 19))
                ])));
  }
}
