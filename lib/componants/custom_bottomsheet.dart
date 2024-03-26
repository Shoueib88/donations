import 'package:donations/const/style.dart';
import 'package:donations/view/Homepage/homescreen/additem/controller/addimage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CustomBottomSheet {
  Bottom_Sheet(context) {
    final controller = Get.put(AddImageController());
    return TextButton.icon(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Choose source',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Obx(() => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                        child: _con('Camera'),
                                        onTap: () {
                                          controller.pickimage(
                                              imagesource: ImageSource.camera);
                                          Navigator.of(context).pop();
                                        }),
                                    GestureDetector(
                                        child:
                                            CustomBottomSheet()._con('Gallery'),
                                        onTap: () {
                                          controller.pickimage(
                                              imagesource: ImageSource.gallery);
                                          Navigator.of(context).pop();
                                        })
                                  ]))
                        ]));
              });
        },
        icon: Icon(Icons.add),
        label: Text('add photo', style: TextStyle(color: K.primaryColor)));
  }

  _con(text) {
    return Container(
      width: 120,
      height: 45,
      decoration: BoxDecoration(
          color: K.primaryColor, border: Border.all(color: K.mainColor)),
      child: Center(
        child: Text(text,
            style: TextStyle(
                color: K.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 25)),
      ),
    );
  }
}
