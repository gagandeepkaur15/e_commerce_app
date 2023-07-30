import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ItemCard extends StatelessWidget {
  final String productImage;
  final String productNAme;
  final String productPrice;
  final Function onTap;

  const ItemCard({
    super.key,
    required this.productImage,
    required this.productNAme,
    required this.productPrice,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
        onTap: onTap(),
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
                      image: AssetImage(productImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  productNAme,
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
                      productPrice,
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 3.h,
                        width: 18.w,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade900),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Add',
                            style: TextStyle(fontSize: 16.sp),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 3.h,
                        width: 16.w,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade900),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            '- 1 +',
                            style: TextStyle(fontSize: 16.sp),
                          ),
                        ),
                      ),
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
