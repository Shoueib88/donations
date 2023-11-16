import 'package:donations/const/style.dart';
import 'package:donations/view/Homepage/homescreen/additem/additem_screen.dart';
import 'package:donations/view/Homepage/homescreen/additem/controller/additemcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:donations/componants/custom_fields.dart';
import 'controller/Map_Controller.dart';

void main() => runApp(const MapScreen());

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controllermap = Get.put(MapController());
    final controlleritem = AddItemController();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Enter your address'),
          centerTitle: true,
          // shape: BoxShape.circle,
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 700,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 390.0,
                      height: 370.0,
                      margin: const EdgeInsets.symmetric(horizontal: 7),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(border: Border.all()),
                      child: GoogleMap(
                          markers: controllermap.markes(),
                          mapType: MapType.normal,
                          initialCameraPosition:
                              controllermap.camerPosition())),
                  Container(
                    width: 340,
                    height: 45,
                    decoration: K.boxDecorationwithcolor(color: K.mainColor),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(controllermap.camerPosition().toString(),
                            style: TextStyle(fontSize: 20))),
                  ),
                  feilds.smalltextfield(
                      controller_apartment: controlleritem.apartmentnum,
                      controller_marque: controlleritem.specialmarque),
                  feilds.largetextfield(
                      text: '\taddress', controller: controlleritem.alladdress),
                  feilds.bottons(onpressed: () async {
                    await controllermap.address(
                        controlleritem.apartmentnum.text,
                        controlleritem.specialmarque.text,
                        controlleritem.alladdress.text);
                    Get.offAll(AddItem());
                  })
                ]),
          ),
        )));
  }
}
