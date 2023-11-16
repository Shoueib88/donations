import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donations/model/user_token.dart';
import 'package:donations/view/auth/otp/otp_screen.dart';
import 'package:donations/view/Homepage/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthServices {
  var verifictionid = ''.obs;
  final auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  //verifyPhone
  verifyPhone(String phone) async {
    await auth.verifyPhoneNumber(
        //timeout: const Duration(seconds: 40),
        phoneNumber: phone,
        verificationCompleted: (phoneAuthCredential) async {
          await auth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) {
          Get.snackbar('error', '$error', snackPosition: SnackPosition.TOP);
        },
        codeSent: (verificationId, forceResendingToken) {
          this.verifictionid.value = verificationId;
          Get.snackbar('Success', 'progress successed',
              snackPosition: SnackPosition.TOP);
          Get.to(OtpScreen());
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verifictionid.value = verificationId;
        });
  }

  //verifyOtp
  sendOtp(String otp) async {
    try {
      var credential = await auth.signInWithCredential(
          PhoneAuthProvider.credential(
              verificationId: this.verifictionid.value, smsCode: otp));
      if (credential.user != null) {
        Get.snackbar('Success', 'Authentication Successed',
            snackPosition: SnackPosition.TOP, backgroundColor: Colors.black26);
        Get.offAll(const Home());
      }
    } catch (e) {
      print('=================================');
      print(e);
      print('=================================');
      Get.snackbar('error', '$e',
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.black26);
    }
    // Get.offAll(const Home());
  }

  setDatatoFirestore(UserModel userModel) async {
    await _firestore
        .collection('UserInfo')
        .doc(auth.currentUser?.uid)
        .collection('listUserInfo')
        .doc()
        .set(userModel.toJson());
  }
}
