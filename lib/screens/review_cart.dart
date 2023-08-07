import 'package:e_commerce_app/screens/single_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReviewCart extends StatelessWidget {
  const ReviewCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        title: Text(
          'Review Cart',
          style: GoogleFonts.merienda(
            color: Colors.black,
            fontSize: 17.sp,
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 1.h,
          ),
          SingleItem(
            isBool: true,
          ),
          SingleItem(
            isBool: true,
          ),
          SizedBox(
            height: 1.h,
          ),
        ],
      ),
    );
  }
}
