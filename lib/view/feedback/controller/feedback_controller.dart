import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackController extends GetxController {
  TextEditingController feedback = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();

  setData() async {
    // Get a reference to the `feedback` collection
    final collection = FirebaseFirestore.instance.collection('feedback');

    // Write the server's timestamp and the user's feedback
    await collection.doc().set({
      'timestamp': FieldValue.serverTimestamp(),
      'feedback': feedback.text,
    });
  }
}
