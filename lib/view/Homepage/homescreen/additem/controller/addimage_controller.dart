import 'dart:io';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddImageController extends GetxController {
  var image1 = ''.obs;
  final loading = false.obs;
  final _storage = FirebaseStorage.instance;
  final _image_picker = ImagePicker();
  var imageing = '';

  pickimage({required ImageSource imagesource}) async {
    try {
      var image = await _image_picker.pickImage(source: imagesource);

      if (image != null) {
        imageing = image.path;
        print('=============================================');
        print(imageing);
      } else {
        var snack = SnackBar(content: Text('please choose photo'));
        ScaffoldMessenger.of(Get.context!).showSnackBar(snack);
      }
    } catch (e) {
      print(e);
    }
    update();
  }

  uploadimagetostorage({required String namepath}) async {
    var file = File(imageing);
    print(file);
    if (file.existsSync()) {
      var imagename = Random().nextInt(1000000000);
      var randomnameimage = '$imagename${image1}';
      //
      final ref = _storage.ref().child('product_image/$randomnameimage');
      //
      final uploadimage = await ref.putFile(file);
      final imageurl = ((await uploadimage).ref.getDownloadURL());
      print('================================= done');
      return imageurl;
    } else {
      print('============================File does not exist.');
    }
  }
}
