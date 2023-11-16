import 'package:donations/const/style.dart';
import 'package:donations/view/Homepage/homescreen/additem/controller/additemcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/otp/controller/otp_controller.dart';

void main() => runApp(const OderDetaile());

class OderDetaile extends StatelessWidget {
  const OderDetaile({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(OtpController());
    final controlitems = Get.put(AddItemController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: K.mainColor,
          title: const Text('Order Detaile'),
          centerTitle: true,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          K.sizedBoxH,
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text('Name :', style: TextStyle(fontWeight: FontWeight.bold)),
            //(controller.listofuser.first.name)!
            Text('shoueib', style: TextStyle(fontWeight: FontWeight.bold))
          ]),
          K.sizedBoxH,
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text('UserPhone :', style: TextStyle(fontWeight: FontWeight.bold)),
            //(controller.listofuser.first.phone)!
            Text('01226528264', style: TextStyle(fontWeight: FontWeight.bold)),
            Icon(Icons.phone, size: 25)
          ]),
          K.sizedBoxH,
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text('Specify Address Details :',
                style: TextStyle(fontWeight: FontWeight.bold)),
            //(controlitems.list.first.address)!
            Container(
                width: 150,
                height: 100,
                child: Text(
                    'addressfwpoJCMVWEVCM IWEPFJFcpooooooooooooowejhpfocnoaiefCOASMCKDVUIEWFLFEWUFEKCOJMIEUFPEJDCCPAMD',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            Icon(Icons.location_on, size: 25)
          ]),
          K.sizedBoxH,
          Container(
              decoration: K.boxDecoration,
              child: Row(children: [
                Container(
                    width: 100,
                    height: 130,
                    //(controlitems.list.first.imageUrl)!

                    child: Image.asset('asset/image/3.png', fit: BoxFit.fill)),
                Container(
                  width: 280,
                  child: Column(
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Date :',
                                style: TextStyle(fontWeight: FontWeight.bold)),

                            //(controlitems.list.first.date)!
                            Text('shoueib',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ]),
                      const Divider(height: 20, color: K.blackColor),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Number OF Pieces :',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            //(controlitems.list.first.pieces)!
                            Text('shoueib',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ]),
                      const Divider(
                        height: 20,
                        color: K.blackColor,
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Status :',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('Success',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ]),
                    ],
                  ),
                )
              ]))
        ]));
  }
}
