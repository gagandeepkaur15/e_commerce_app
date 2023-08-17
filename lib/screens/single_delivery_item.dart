import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SingleDeliveryItem extends StatelessWidget {
  final String title;
  final String address;
  final String number;
  final String addressType;
  const SingleDeliveryItem(
      {super.key,
      required this.title,
      required this.addressType,
      required this.address,
      required this.number});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 1.h,
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Container(
                width: 17.w,
                padding: EdgeInsets.all(1.sp),
                height: 2.5.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    addressType,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          leading: CircleAvatar(
            radius: 12.sp,
            backgroundColor: Colors.grey.shade800,
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                address,
                style: TextStyle(
                  fontSize: 16.5.sp,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                number,
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
        Divider(height: 3.5.h),
      ],
    );
  }
}
