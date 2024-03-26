import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donations/model/item_model.dart';
import 'package:donations/view/Homepage/homescreen/Add_Location/controller/Map_Controller.dart';
import 'package:donations/view/Homepage/homescreen/additem/controller/addimage_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/additemservices.dart';
import '../services/getitems.dart';

class AddItemController extends GetxController {
  TextEditingController pieces = TextEditingController();
  Rx<TextEditingController> address = TextEditingController().obs;
  TextEditingController time = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController specialmarque = TextEditingController();
  TextEditingController apartmentnum = TextEditingController();
  TextEditingController alladdress = TextEditingController();

  final loading = false.obs;
  final addservices = AddItemServices();
  final addimage = AddImageController();
  final firestore = FirebaseFirestore.instance;

  // setdata() async {
  //   await addservices.adddata(
  //       model: ItemModel(
  //     pieces: pieces.text,
  //     address: MapController().position.toString(),
  //     time: date.text,
  //     date: time.text,
  //     imageUrl:
  //         await addimage.uploadimagetostorage(namepath: addimage.image1.value),
  //     areaNumber: specialmarque.text,
  //     apartmentNumber: apartmentnum.text,
  //   ));
  // }

  RxList<ItemModel> list = <ItemModel>[].obs;
  getAllData() async {
    loading.value = true;
    try {
      final data = await GetItemsServices().getAllData();
      print(data);

      list.assignAll(data);

      loading.value = false;
    } catch (e) {
      print(e);
    }
  }

  dataUpLoad(
      File? image, pieces, date, time, specialmarque, apartmentnum) async {
    // Upload image file to Firebase Storage
    var imageName = DateTime.now().millisecondsSinceEpoch.toString();
    var storageRef =
        FirebaseStorage.instance.ref().child('users/$imageName.jpg');
    var uploadTask = storageRef.putFile(image!);
    var downloadUrl = await (await uploadTask).ref.getDownloadURL();

    addservices.adddata(
        model: ItemModel(
      pieces: pieces,
      address: MapController()
          .address(specialmarque, apartmentnum, alladdress)
          .toString(),
      time: date,
      date: time,
      imageUrl: downloadUrl.toString(),
      areaNumber: specialmarque,
      apartmentNumber: apartmentnum,
    ));
  }
}
