import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddImageController extends GetxController {
  var image1 = ''.obs;
  final loading = false.obs;
  final _image_picker = ImagePicker();
  final _storage = FirebaseStorage.instance;
  Rx<File> fileimage = File('').obs;

  pickimage({required ImageSource imagesource}) async {
    try {
      var image = await _image_picker.pickImage(source: imagesource);

      if (image != null) {
        fileimage.value = File(image.path);
        print('=============================================');
        print(fileimage);
      } else {
        var snack = SnackBar(content: Text('please choose photo'));
        ScaffoldMessenger.of(Get.context!).showSnackBar(snack);
      }
    } catch (e) {
      print(e);
    }
    // update();
  }

  // uploadimagetostorage({required String namepath}) async {
  //   var file = File(image1.value);
  //   print(file);
  //   if (file.existsSync()) {
  //     var imagename = Random().nextInt(1000000000);
  //     var randomnameimage = '$imagename${image1}';
  //     //
  //     final ref = _storage.ref().child('product_image/$randomnameimage');
  //     //
  //     final uploadimage = await ref.putFile(file);
  //     final imageurl = ((await uploadimage).ref.getDownloadURL());
  //     print('================================= done');
  //     return imageurl;
  //   } else {
  //     print('============================File does not exist.');
  //   }
  // }
}
