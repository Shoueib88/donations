import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../model/item_model.dart';

class GetItemsServices {
  final store = FirebaseFirestore.instance;
  //final _auth = FirebaseAuth.instance;

  Future<List<ItemModel>> getAllData() async {
    //final user = _auth.currentUser;
    //final userId = user?.uid;

    CollectionReference collectionReference = store.collection("products");

    QuerySnapshot querySnapshot = await collectionReference.get();

    List<ItemModel> items = [];
    for (var doc in querySnapshot.docs) {
      var data = doc.data();
      var jsonedata = jsonEncode(data);
      ItemModel item = ItemModel.fromJson(
          jsonedata as QueryDocumentSnapshot<Map<String, dynamic>>);
      items.add(item);
    }
    return items;
  }
}
