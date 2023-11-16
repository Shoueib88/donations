import 'package:donations/model/item_model.dart';
import 'package:donations/view/Homepage/homescreen/Add_Location/controller/Map_Controller.dart';
import 'package:donations/view/Homepage/homescreen/additem/controller/addimage_controller.dart';
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

  setdata() async {
    await addservices.adddata(
        model: ItemModel(
      pieces: pieces.text,
      address: MapController().position.toString(),
      time: date.text,
      date: time.text,
      imageUrl:
          await addimage.uploadimagetostorage(namepath: addimage.imageing),
      areaNumber: specialmarque.text,
      apartmentNumber: apartmentnum.text,
    ));
  }

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
}
