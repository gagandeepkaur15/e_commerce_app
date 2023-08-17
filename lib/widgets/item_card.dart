import 'package:e_commerce_app/providers/review_cart_provider.dart';
import 'package:e_commerce_app/widgets/count.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ItemCard extends StatefulWidget {
  final String productId;
  final String productImage;
  final String productNAme;
  final String productPrice;
  final Function onTap;
  final String productQuantity;

  const ItemCard({
    super.key,
    required this.productId,
    required this.productImage,
    required this.productNAme,
    required this.productPrice,
    required this.onTap,
    this.productQuantity='',
  });

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  ReviewCartProvider? reviewCartProvider;
  @override
  Widget build(BuildContext context) {
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    reviewCartProvider!.getReviewCartData();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
        onTap: widget.onTap(),
        child: Container(
          height: 25.h,
          width: 40.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 15.h,
                  width: 35.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(widget.productImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  widget.productNAme,
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
                ),
                Row(
                  children: [
                    Text(
                      "₹",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    Text(
                      widget.productPrice,
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Count(
                      productId: widget.productId,
                      productName: widget.productNAme,
                      productPrice: widget.productPrice,
                      productImage: widget.productImage,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
