import 'package:e_commerce_app/providers/review_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
  int count = 1;
  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
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
                        } else {
                          setState(() {
                            count--;
                          });
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
                          fontSize: 16.sp, color: Colors.green.shade700),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          count++;
                        });
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
                          cartQuantity: count.toString());   
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
