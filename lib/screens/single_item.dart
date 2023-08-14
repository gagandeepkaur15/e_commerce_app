import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class SingleItem extends StatelessWidget {
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
  Widget build(BuildContext context) {
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
                      child: Image.asset(productImage),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 10.h,
                  child: Column(
                    mainAxisAlignment: isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productName,
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
                                productPrice,
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 16.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                      isBool == false
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
                          : Text(
                              "1 pc",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.sp,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 90,
                  padding: isBool == false
                      ? EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.5.h)
                      : EdgeInsets.only(left: 1.5.h, right: 1.5.h),
                  child: isBool == false
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
                                onDelete();
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
                                    Icon(
                                      Icons.remove,
                                      color: Colors.grey.shade900,
                                      size: 20,
                                    ),
                                    const Text(
                                      "ADD",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Icon(
                                      Icons.add,
                                      color: Colors.grey.shade900,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
        isBool == false
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