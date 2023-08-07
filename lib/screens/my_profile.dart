import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'My Profile',
          style: GoogleFonts.merienda(color: Colors.black, fontSize: 17.sp),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 17.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.sp),
                bottomRight: Radius.circular(30.sp),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 40, 20, 10),
                  child: CircleAvatar(
                    radius: 30.sp,
                    backgroundColor: Colors.grey.shade300,
                    child: Icon(
                      Icons.person_outline,
                      size: 37.sp,
                      color: Colors.black,
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      'Gagandeep Kaur',
                      style: TextStyle(fontSize: 17.sp),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'gagandeep4989@gmail.com',
                      style: TextStyle(fontSize: 17.sp),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 5.h),
          listTile(Icons.shopping_basket_outlined, 'My Orders'),
          SizedBox(height: 2.h),
          listTile(Icons.location_on_outlined, 'My Delivery Address'),
          SizedBox(height: 2.h),
          listTile(Icons.file_copy_outlined, 'Terms and Conditions'),
          SizedBox(height: 2.h),
          listTile(Icons.policy_outlined, 'Privacy Policy'),
          SizedBox(height: 2.h),
          listTile(Icons.add_chart, 'About'),
          SizedBox(height: 2.h),
          listTile(Icons.exit_to_app_outlined, 'Log Out'),
        ],
      ),
    );
  }
}

Widget listTile(IconData icon, String title) {
  return Column(
    children: [
      const Divider(
        height: 1,
      ),
      Container(
        color: Colors.white,
        child: ListTile(
          leading: Icon(icon, color: Colors.grey.shade900),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey.shade900),
        ),
      )
    ],
  );
}
