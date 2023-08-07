import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductOverview extends StatefulWidget {
  final String productName;
  final String productPrice;
  final String productImage;

  const ProductOverview(
      {super.key,
      required this.productName,
      required this.productPrice,
      required this.productImage});

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  Widget bottomNavigatorBar(
      {required Color iconColor,
      required Color backgroundColor,
      required Color color,
      required String title,
      required IconData iconData}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20.sp),
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 17.sp,
              color: iconColor,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              title,
              style: TextStyle(color: color),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bottomNavigatorBar(
            iconColor: Colors.black,
            backgroundColor: Colors.white,
            color: Colors.black,
            title: "Add To WishList",
            iconData: Icons.favorite_outline,
          ),
          bottomNavigatorBar(
            iconColor: Colors.black,
            backgroundColor: Colors.white,
            color: Colors.black,
            title: "Add To Bag",
            iconData: Icons.shopping_bag_outlined,
          )
        ],
      ),
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          'Product Overview',
          style: GoogleFonts.merienda(color: Colors.black, fontSize: 17.sp),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey.shade900),
        elevation: 1,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(15.0.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        widget.productName,
                        style: TextStyle(fontSize: 20.sp),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            "₹",
                            style: TextStyle(fontSize: 20.sp),
                          ),
                          Text(
                            widget.productPrice.toString(),
                            style: TextStyle(fontSize: 20.sp),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 45.h,
                      padding: EdgeInsets.all(25.sp),
                      child: Image(
                        image: AssetImage(widget.productImage),
                      ),
                    ),
                    Text(
                      'About This Product',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                      style: TextStyle(fontSize: 17.sp),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
