import 'package:donations/view/Homepage/details/controller/detailscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/style.dart';
import '../view/Homepage/details/orderdetaile.dart';

void main() => runApp(const CustomListView());

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 2,
      separatorBuilder: (BuildContext context, int index) {
        return K.sizedBoxH;
      },
      itemBuilder: (BuildContext context, int index) {
        return Container(
            margin: const EdgeInsets.only(top: 10, right: 5, left: 5),
            decoration: K.boxDecorationgreycolor,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(children: [
                  Container(
                      decoration: K.boxDecoration,
                      width: 100,
                      height: 130,
                      //(controlitems.list.first.imageUrl)!

                      child:
                          Image.asset('asset/image/3.png', fit: BoxFit.fill)),
                  Container(
                      width: 250,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Date :',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),

                                  //(controlitems.list.first.date)!
                                  Text('shoueib',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))
                                ]),
                            K.sizedBoxH,
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Number OF Pieces :',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  //(controlitems.list.first.pieces)!
                                  Text('shoueib',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))
                                ]),
                            K.sizedBoxH,
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Status :',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text('Success',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))
                                ]),
                          ]))
                ]),
                K.sizedBoxH,
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 160,
                        height: 40,
                        decoration: K.boxDecorationgreycolor,
                        child: MaterialButton(
                          onPressed: () {
                            Get.to(OderDetaile());
                          },
                          child: Text('Cancel'),
                        ),
                      ),
                      GetBuilder(
                          init: DetialsController(),
                          builder: (controller) {
                            return Container(
                                alignment: Alignment.center,
                                width: 160,
                                height: 40,
                                decoration: K.boxDecorationwithcolor(
                                    color: K.primaryColor),
                                child: MaterialButton(
                                  onPressed: () async {
                                    await controller.currentIndex(index);
                                    Get.to(OderDetaile());
                                  },
                                  child: Text('Detials',
                                      style: TextStyle(color: K.whiteColor)),
                                ));
                          })
                    ]),
                K.sizedBoxH,
              ],
            ));
      },
    );
  }
}
