import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donations/model/item_model.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class AddItemServices {
  // final auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  adddata({required ItemModel model}) async {
    final products = _firestore
        .collection('products')
        .doc()
        .collection('listUserInfo')
        .doc();
    await products.set(model.toJson());
  }
}
