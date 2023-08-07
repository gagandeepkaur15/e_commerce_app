import 'package:e_commerce_app/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel?> madhubaniArtList = [];
  ProductModel? productModel;

  List<ProductModel?> lightList = [];

  List<ProductModel?> flowerPotList = [];

  fetchMadhubaniArtData() async {
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("MadhubaniArt").get();

    value.docs.forEach((element) {
      productModel = ProductModel(
        productImage: element.get("productImage"),
        productName: element.get("productName"),
        productPrice: element.get("productPrice"),
      );
      madhubaniArtList.add(productModel);
    });
    print(madhubaniArtList);
    notifyListeners();
  }

  List<ProductModel?> get getMadhubaniArtList {
    return madhubaniArtList;
  }

  fetchLightData() async {
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("Lights").get();

    value.docs.forEach((element) {
      productModel = ProductModel(
        productImage: element.get("productImage"),
        productName: element.get("productName"),
        productPrice: element.get("productPrice"),
      );
      lightList.add(productModel);
    });
    print(lightList);
    notifyListeners();
  }

  List<ProductModel?> get getLightList {
    return lightList;
  }

  fetchFlowerPotData() async {
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("Flower Pots").get();

    value.docs.forEach((element) {
      productModel = ProductModel(
        productImage: element.get("productImage"),
        productName: element.get("productName"),
        productPrice: element.get("productPrice"),
      );
      flowerPotList.add(productModel);
    });
    print(flowerPotList);
    notifyListeners();
  }

  List<ProductModel?> get getflowerPotList {
    return flowerPotList;
  }
}
