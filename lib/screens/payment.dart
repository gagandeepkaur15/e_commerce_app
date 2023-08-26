//Not Responsive
import 'package:e_commerce_app/providers/review_cart_provider.dart';
import 'package:e_commerce_app/screens/my_google_pay.dart';
import 'package:e_commerce_app/screens/upi_payment.dart';
import 'package:e_commerce_app/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();

    double discount = 0.00;
    double shippingCharge = 0.0;
    double subTotal = reviewCartProvider.getTotalPrice();
    if (subTotal < 300) {
      shippingCharge = 0.00;
    }
    double discountedVal = (subTotal * discount) / 100;
    double total = subTotal - discountedVal + shippingCharge;

    return Scaffold(
      bottomNavigationBar: ListTile(
        title: const Text('Total Amount'),
        subtitle: Text(
          total.toString() ?? subTotal.toString(),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        trailing: SizedBox(
          width: 160,
          child: MaterialButton(
            onPressed: () {
              myType == PaymentType.Online
                  // ? Navigator.of(context).push(
                  //     MaterialPageRoute(
                  //       builder: (context) =>
                  //           MyGooglePay(total: total.toString()),
                  //     ),
                  //   )
                  ? Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const UpiPayment(),
                      ),
                    )
                  : Container();
            },
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
                    title: Text(
                        "Order ${reviewCartProvider.getReviewCartDataList.length} items"),
                    children: reviewCartProvider.getReviewCartDataList.map((e) {
                      return OrderItem(e: e);
                    }).toList(),
                  ),
                  const Divider(),
                  ListTile(
                    minVerticalPadding: 5,
                    leading: const Text(
                      "Sub Total",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      subTotal.toString(),
                      style: const TextStyle(
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
                      "0.00",
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
