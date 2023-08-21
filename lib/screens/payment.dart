//Not Responsive

import 'package:e_commerce_app/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PaymentSummary extends StatefulWidget {
  const PaymentSummary({super.key});

  @override
  State<PaymentSummary> createState() => _PaymentSummaryState();
}

enum PaymentType {
  Online,
  COD,
}

class _PaymentSummaryState extends State<PaymentSummary> {
  var myType = PaymentType.COD;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: const Text('Total Amount'),
        subtitle: const Text(
          '300',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        trailing: SizedBox(
          width: 160,
          child: MaterialButton(
            onPressed: () {},
            color: Colors.grey[900],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: const Text(
              "Place order",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Payment Summary',
          style: GoogleFonts.merienda(color: Colors.black, fontSize: 17.sp),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView(
            // .builder(
            // itemBuilder: (context, index) {
            // return
            children: [
              Column(
                children: [
                  const ListTile(
                    title: Text("Gagandeep Kaur"),
                    subtitle: Text("Rajouri Garden"),
                  ),
                  const Divider(),
                  ExpansionTile(
                    title: const Text("Order 5 items"),
                    children: [
                      OrderItem(),
                      OrderItem(),
                      OrderItem(),
                      OrderItem(),
                      OrderItem(),
                    ],
                  ),
                  const Divider(),
                  const ListTile(
                    minVerticalPadding: 5,
                    leading: Text(
                      "Sub Total",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      "Rs 200",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const ListTile(
                    minVerticalPadding: 5,
                    leading: Text(
                      "Shipping Charges",
                      style: TextStyle(),
                    ),
                    trailing: Text(
                      "Rs 0",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const ListTile(
                    minVerticalPadding: 5,
                    leading: Text(
                      "Coupon Discount",
                      style: TextStyle(),
                    ),
                    trailing: Text(
                      "Rs 0",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(),
                  const ListTile(
                    leading: Text("Payment Option"),
                  ),
                  RadioListTile(
                    value: PaymentType.COD,
                    groupValue: myType,
                    title: const Text("COD"),
                    onChanged: (PaymentType? value) {
                      setState(() {
                        myType = value!;
                      });
                    },
                    secondary: Icon(
                      Icons.devices_other,
                      color: Colors.grey.shade900,
                    ),
                  ),
                  RadioListTile(
                    value: PaymentType.Online,
                    groupValue: myType,
                    title: const Text("Online"),
                    onChanged: (PaymentType? value) {
                      setState(() {
                        myType = value!;
                      });
                    },
                    secondary: Icon(
                      Icons.devices_other,
                      color: Colors.grey.shade900,
                    ),
                  ),
                ],
              )
            ]
            // },
            ),
      ),
    );
  }
}
