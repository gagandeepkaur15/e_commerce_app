import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  void addUserData(
      {required User? currentUser,
      required String? userName,
      required String? userEmail,
      required String? userImage}) async {
    await FirebaseFirestore.instance
        .collection("usersData")
        .doc(currentUser!.uid)
        .set({
      "userName": userName,
      "userEmail": userEmail,
      "userImage": userImage,
      "userUid": currentUser.uid
    });
  }
}
