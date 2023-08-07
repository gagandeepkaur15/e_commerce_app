import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'single_item.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text(
          "Total Amount",
          style: TextStyle(
            color: Colors.grey.shade900,
            fontSize: 16.sp,
          ),
        ),
        subtitle: Text(
          "1999",
          style: TextStyle(
              color: Colors.grey.shade900,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold),
        ),
        trailing: SizedBox(
          width: 40.w,
          child: OutlinedButton(
            onPressed: () {},
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.sp),
                ),
              ),
            ),
            child: Text(
              "Next",
              style: TextStyle(color: Colors.grey.shade900, fontSize: 16.5.sp),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 20.sp,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        title: Text(
          'Search',
          style: GoogleFonts.merienda(
            color: Colors.black,
            fontSize: 17.sp,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 52,
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.grey.shade900),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: "Search for items in the store",
                suffixIcon: Icon(
                  Icons.search,
                  size: 20.sp,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 1.2.h,
          ),
          SingleItem(
            isBool: false,
          ),
          SingleItem(
            isBool: false,
          ),
          SingleItem(
            isBool: false,
          ),
          SingleItem(
            isBool: false,
          ),
          SingleItem(
            isBool: false,
          ),
        ],
      ),
    );
  }
}
