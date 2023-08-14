import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/providers/review_cart_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class Count extends StatefulWidget {
  String productName;
  String productImage;
  String productId;
  String productPrice;

  Count({
    super.key,
    required this.productName,
    required this.productImage,
    required this.productId,
    required this.productPrice,
  });

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 0;
  bool isTrue = false;

  getAddAndQuantity() {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .doc(widget.productId)
        .get()
        .then((value) => {
              if (this.mounted)
                {
                  if (value.exists)
                    {
                      setState(() {
                        count = int.tryParse(value.get("cartQuantity")) ?? 0;
                        isTrue = value.get("isAdd");
                      })
                    }
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    getAddAndQuantity();
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    return Container(
      height: 4.5.h,
      width: 18.w,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green.shade700),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: isTrue == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        if (count == 1) {
                          setState(() {
                            isTrue = false;
                            count--;
                          });
                          reviewCartProvider
                              .reviewCartDataDelete(widget.productId);
                        } else if (count > 1) {
                          setState(() {
                            count--;
                          });
                          reviewCartProvider.updateReviewCartData(
                            cartId: widget.productId,
                            cartName: widget.productName,
                            cartImage: widget.productImage,
                            cartPrice: widget.productPrice,
                            cartQuantity: count.toString(),
                          );
                        }
                      },
                      child: Icon(
                        Icons.remove,
                        size: 19.sp,
                        color: Colors.green.shade700,
                      ),
                    ),
                    Text(
                      count.toString(),
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.green.shade700,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          count++;
                        });
                        reviewCartProvider.updateReviewCartData(
                          cartId: widget.productId,
                          cartName: widget.productName,
                          cartImage: widget.productImage,
                          cartPrice: widget.productPrice,
                          cartQuantity: count.toString(),
                        );
                      },
                      child: Icon(
                        Icons.add,
                        size: 19.sp,
                        color: Colors.green.shade700,
                      ),
                    ),
                  ],
                )
              : Center(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isTrue = true;
                      });
                      reviewCartProvider.addReviewCartData(
                        cartId: widget.productId,
                        cartName: widget.productName,
                        cartImage: widget.productImage,
                        cartPrice: widget.productPrice,
                        cartQuantity: count.toString(),
                      );
                    },
                    child: Text(
                      'ADD',
                      style: TextStyle(
                          fontSize: 16.sp, color: Colors.green.shade700),
                    ),
                  ),
                )),
    );
  }
}
