import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/review_cart_model.dart';

class ReviewCartProvider with ChangeNotifier {
  void addReviewCartData({
    required String? cartId,
    required String? cartName,
    required String? cartImage,
    required String? cartPrice,
    required String? cartQuantity,
  }) async {
    await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .set({
      "cartId": cartId,
      "cartName": cartName,
      "cartImage": cartImage,
      "cartPrice": cartPrice,
      "cartQuantity": cartQuantity,
    });
  }

  List<ReviewCartModel> reviewCartDataList = [];
  void getReviewCartData() async {
    QuerySnapshot reviewCartData = await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .get();
    reviewCartData.docs.forEach((element) {
      ReviewCartModel reviewCartModel = ReviewCartModel(
        cartId: element.get("cartId"),
        cartImage: element.get("cartImage"),
        cartName: element.get("cartName"),
        cartPrice: element.get("cartPrice"),
        cartQuantity: element.get("cartQuantity"),
      );
      reviewCartDataList.add(reviewCartModel);
    });
    notifyListeners();
  }

  get getReviewCartDataList {
    return reviewCartDataList;
  }
}
