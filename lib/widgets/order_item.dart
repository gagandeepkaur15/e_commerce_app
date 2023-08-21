import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  OrderItem({super.key});

  bool? isTrue;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        "assets/madhubani/plant1.png",
        width: 60,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Wall art",
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          Text(
            "Rs 2000",
            style: TextStyle(
                // color: Colors.grey[600],
                ),
          ),
        ],
      ),
      subtitle: Text("5"),
    );
  }
}
