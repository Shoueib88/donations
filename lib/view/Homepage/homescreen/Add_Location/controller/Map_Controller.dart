import 'package:donations/view/Homepage/homescreen/additem/controller/additemcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapController extends GetxController {
  final addcontroller = AddItemController();
  String currentlocation = '';

  Position? position;

  address(specialmarque, apartmentnum, alladdress) {
    List list = [specialmarque, apartmentnum, alladdress, position.toString()];
    for (var element in list) {
      addcontroller.address.value.text += element;
    }
    update();
    return addcontroller.address.value.text;
  }

  camerPosition() {
    return CameraPosition(
        target: LatLng(position!.latitude, position!.longitude), zoom: 14);
  }

  markes() {
    Set<Marker> mymark = {
      Marker(
          markerId: MarkerId('1'),
          position: LatLng(position!.latitude, position!.longitude))
    };
    return mymark;
  }

  getCurrentPosation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        var snack = SnackBar(content: Text('LocationPermission denied'));
        return ScaffoldMessenger(child: snack);
      }
    }

    position = await Geolocator.getCurrentPosition();
  }

  @override
  void onInit() {
    getCurrentPosation();
    super.onInit();
  }
}
