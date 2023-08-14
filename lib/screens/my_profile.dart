import 'package:e_commerce_app/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyProfile extends StatefulWidget {
  UserModel userData;
  MyProfile({super.key, required this.userData});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
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
                SizedBox(
                  width: 2.w,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 40, 20, 10),
                  child: CircleAvatar(
                    radius: 25.sp,
                    backgroundColor: Colors.grey.shade300,
                    backgroundImage: NetworkImage(widget.userData.userImage),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      widget.userData.userName,
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      widget.userData.userEmail,
                      style: TextStyle(fontSize: 15.sp),
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
