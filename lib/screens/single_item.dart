import 'package:e_commerce_app/providers/review_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class SingleItem extends StatefulWidget {
  bool isBool = false;
  String productImage;
  String productName;
  String productPrice;
  String productId;
  String productQuantity;
  Function onDelete;

  SingleItem({
    super.key,
    required this.isBool,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productId,
    this.productQuantity = '',
    this.onDelete = _defaultDeleteFunction,
  });

  @override
  State<SingleItem> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  ReviewCartProvider? reviewCartProvider;

  int count = 0;
  getCount() {
    setState(() {
      count = int.parse(widget.productQuantity);
    });
  }

  // @override
  // void initState() {
  //   getCount();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    getCount();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.w),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 12.h,
                  child: Padding(
                    padding: EdgeInsets.all(9.sp),
                    child: Center(
                      child: Image.asset(widget.productImage),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 10.h,
                  child: Column(
                    mainAxisAlignment: widget.isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.productName,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp),
                          ),
                          Row(
                            children: [
                              Text(
                                "₹",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 16.sp),
                              ),
                              Text(
                                widget.productPrice,
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 16.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                      widget.isBool == false
                          ? Container(
                              margin: EdgeInsets.only(right: 5.w),
                              padding: EdgeInsets.symmetric(horizontal: 4.w),
                              height: 35,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30.sp),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "1",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      size: 20.sp,
                                      color: Colors.grey.shade900,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      // : Text(
                      //     "1 pc",
                      //     style: TextStyle(
                      //       color: Colors.grey,
                      //       fontSize: 16.sp,
                      //     ),
                      //   ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 90,
                  padding: widget.isBool == false
                      ? EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.5.h)
                      : EdgeInsets.only(left: 1.5.h, right: 1.5.h),
                  child: widget.isBool == false
                      ? Container(
                          height: 25,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30.sp),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add,
                                    color: Colors.grey.shade900, size: 20),
                                const Text(
                                  "ADD",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Column(
                          children: [
                            InkWell(
                              onTap: () {
                                widget.onDelete();
                              },
                              child: const Icon(
                                Icons.delete,
                                size: 30,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 4.5.h,
                              width: 70.w,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (count == 1) {
                                          Fluttertoast.showToast(
                                              msg: "You reached minimum limit");
                                        } else {
                                          setState(() {
                                            count--;
                                          });

                                          reviewCartProvider!
                                              .updateReviewCartData(
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
                                        color: Colors.grey.shade900,
                                        size: 20,
                                      ),
                                    ),
                                    Text(
                                      count.toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        print("Tapped Icon");
                                        setState(() {
                                          count++;
                                          print("Count: $count");
                                        });

                                        print("Updating Cart Data");
                                        if (reviewCartProvider != null) {
                                          print("Inside update function");
                                          reviewCartProvider!
                                              .updateReviewCartData(
                                            cartId: widget.productId,
                                            cartName: widget.productName,
                                            cartImage: widget.productImage,
                                            cartPrice: widget.productPrice,
                                            cartQuantity: count.toString(),
                                          );
                                        }
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.grey.shade900,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Count(
                            //   productId: widget.productId,
                            //   productName: widget.productName,
                            //   productPrice: widget.productPrice,
                            //   productImage: widget.productImage,
                            // ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
        widget.isBool == false
            ? Container()
            : const Divider(
                height: 1,
                color: Colors.black45,
              )
      ],
    );
  }
}

void _defaultDeleteFunction() {
  print('Default delete called');
}

//Not fully responsive