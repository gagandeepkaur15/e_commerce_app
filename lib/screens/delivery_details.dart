import 'package:e_commerce_app/screens/payment.dart';
import 'package:e_commerce_app/screens/single_delivery_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DeliveryDetails extends StatelessWidget {
  DeliveryDetails({super.key});

  List<Widget> address = const [
    SingleDeliveryItem(
      address: "Lajpat Nagar",
      addressType: "Home",
      title: "Gagandeep Kaur",
      number: "9811834567",
    ),
  ];

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
            onPressed: () {
              address.isEmpty
                  ? print('Add address Page')
                  : Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PaymentSummary(),
                      ),
                    );
            },
            child: address.isEmpty
                ? Text(
                    'Add new address',
                    style: TextStyle(fontSize: 16.sp, color: Colors.black),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Payment Summary',
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                      SizedBox(width: 5.w),
                      Icon(Icons.forward, size: 23.sp, color: Colors.black)
                    ],
                  )),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Delivery Details',
          style: GoogleFonts.merienda(
            color: Colors.black,
            fontSize: 17.sp,
          ),
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
          Column(
            children: [
              address.isEmpty
                  ? Container()
                  : const SingleDeliveryItem(
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
