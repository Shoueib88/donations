import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class K {
  //constants
  static Color primaryColor = Color.fromARGB(255, 140, 197, 166);
  static const mainColor = Colors.grey; //shared
  static const blackColor = Colors.black; //shared
  static const whiteColor = Colors.white; //shared
  static final sizedBoxH = SizedBox(height: 20);
  static final sizedBoxW = SizedBox(width: 25);
  static final boxDecoration = BoxDecoration(
    border: Border.all(color: primaryColor, width: 3),
    borderRadius: BorderRadius.circular(13),
  );
  static final boxDecorationgreycolor = BoxDecoration(
    border: Border.all(color: mainColor, width: 3),
    borderRadius: BorderRadius.circular(13),
  );
  static boxDecorationwithcolor({required Color color}) {
    return BoxDecoration(
      color: color,
      border: Border.all(color: primaryColor, width: 3),
      borderRadius: BorderRadius.circular(10),
    );
  }

  // some icons
  static const phoneicon = Icons.phone;
  static const emailicon = Icons.email;
  static const faceicon = FontAwesomeIcons.facebook;
  static const instgramicon = FontAwesomeIcons.instagram;
  static const twitter = FontAwesomeIcons.twitter;
}
