import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../model/user_token.dart';

class GetUserInfoService {
  final store = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<List<UserModel>> getDat() async {
    final user = _auth.currentUser;
    final userId = user?.uid;

    CollectionReference collectionReference =
        store.collection("UserInfo").doc(userId).collection("listUserInfo");

    QuerySnapshot querySnapshot = await collectionReference.get();

    List<UserModel> items = [];
    for (var doc in querySnapshot.docs) {
      var data = doc.data();
      var jsonedata = jsonEncode(data);
      UserModel item = UserModel.fromJson(
          jsonedata as QueryDocumentSnapshot<Map<String, dynamic>>);
      items.add(item);
    }
    return items;
  }
}
