import 'package:e_commerce_app/screens/single_delivery_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DeliveryDetails extends StatelessWidget {
  const DeliveryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.grey.shade800,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Container(
        width: 16.w,
        height: 4.8.h,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.sp),
          ),
          onPressed: () {},
          child: Text(
            'Add new address',
            style: TextStyle(fontSize: 16.sp, color: Colors.black),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Delivery Details',
          style: GoogleFonts.merienda(color: Colors.black, fontSize: 17.sp),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              'Deliver to',
              style: TextStyle(fontSize: 18.sp),
            ),
            leading: Icon(
              Icons.location_on,
              color: Colors.red,
              size: 23.sp,
            ),
          ),
          Divider(
            height: 0.2.h,
          ),
          const Column(
            children: [
              SingleDeliveryItem(
                address: "Lajpat Nagar",
                addressType: "Home",
                title: "Gagandeep Kaur",
                number: "9811834567",
              ),
            ],
          )
        ],
      ),
    );
  }
}
