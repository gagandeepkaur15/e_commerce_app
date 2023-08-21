import 'package:e_commerce_app/model/review_cart_model.dart';
import 'package:e_commerce_app/providers/review_cart_provider.dart';
import 'package:e_commerce_app/screens/delivery_details.dart';
import 'package:e_commerce_app/screens/single_item.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReviewCart extends StatefulWidget {
  @override
  State<ReviewCart> createState() => _ReviewCartState();
}

class _ReviewCartState extends State<ReviewCart> {
  late ReviewCartProvider reviewCartProvider;

  showAlertDialog(BuildContext context, ReviewCartModel delete) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Yes"),
      onPressed: () {
        reviewCartProvider.reviewCartDataDelete(delete.cartId);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Cart Product"),
      content: const Text("Sure you want to delete this product?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      bottomNavigationBar: ListTile(
        title: Text(
          "Total Amount",
          style: TextStyle(fontSize: 17.sp),
        ),
        subtitle: Text(
          "\₹ ${reviewCartProvider.getTotalPrice()}",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp),
        ),
        trailing: SizedBox(
          width: 160,
          child: MaterialButton(
            color: Colors.grey.shade900,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
            onPressed: () {
              if (reviewCartProvider.getReviewCartDataList.isEmpty) {
                Fluttertoast.showToast(msg: "No Cart Data Found");
              } else {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DeliveryDetails(),
                  ),
                );
              }
            },
            child: Text(
              "Submit",
              style: TextStyle(fontSize: 17.sp, color: Colors.white),
            ),
          ),
        ),
      ),
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
      body: reviewCartProvider.getReviewCartDataList.isEmpty
          ? Center(
              child: Text(
                'No Data',
                style: TextStyle(fontSize: 18.sp),
              ),
            )
          : ListView.builder(
              itemCount: reviewCartProvider.getReviewCartDataList.length,
              itemBuilder: (context, index) {
                ReviewCartModel data =
                    reviewCartProvider.getReviewCartDataList[index];
                return Column(
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    SingleItem(
                      isBool: true,
                      productImage: data.cartImage,
                      productName: data.cartName,
                      productPrice: data.cartPrice,
                      productId: data.cartId,
                      productQuantity: data.cartQuantity,
                      onDelete: () {
                        showAlertDialog(context, data);
                      },
                    ),
                  ],
                );
              },
            ),
    );
  }
}
