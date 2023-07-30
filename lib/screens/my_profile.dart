import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'My Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 170,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 40, 20, 10),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.shade300,
                    child: const Icon(
                      Icons.person_outline,
                      size: 67,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Column(
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    Text(
                      'Gagandeep Kaur',
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('gagandeep4989@gmail.com')
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          listTile(Icons.shopping_basket_outlined, 'My Orders'),
          const SizedBox(height: 8),
          listTile(Icons.location_on_outlined, 'My Delivery Address'),
          const SizedBox(height: 8),
          listTile(Icons.file_copy_outlined, 'Terms and Conditions'),
          const SizedBox(height: 8),
          listTile(Icons.policy_outlined, 'Privacy Policy'),
          const SizedBox(height: 8),
          listTile(Icons.add_chart, 'About'),
          const SizedBox(height: 8),
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
