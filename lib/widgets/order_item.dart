import 'package:e_commerce_app/model/review_cart_model.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final ReviewCartModel e;
  OrderItem({super.key, required this.e});

  bool? isTrue;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        e.cartImage,
        width: 60,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            e.cartName,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          Text(
            e.cartPrice,
            style: TextStyle(
                // color: Colors.grey[600],
                ),
          ),
        ],
      ),
      subtitle: Text(e.cartQuantity),
    );
  }
}
