import 'package:e_commerce_app/screens/my_profile.dart';
import 'package:e_commerce_app/screens/product_overview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../widgets/item_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      drawer: Drawer(
        child: Container(
          color: Colors.grey.shade100,
          child: ListView(
            children: [
              DrawerHeader(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      maxRadius: 28.sp,
                    ),
                    SizedBox(
                      width: 14.sp,
                    ),
                    Text(
                      "Welcome XXX",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ],
                ),
              ),
              listTile(
                icon: Icons.home,
                title: "Home",
              ),
              listTile(icon: Icons.shop, title: "Review Cart"),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyProfile()));
                  },
                  child: listTile(icon: Icons.person, title: "My Profile")),
              listTile(icon: Icons.notifications, title: "Notification"),
              listTile(icon: Icons.star, title: "Ratings and Review"),
              listTile(icon: Icons.favorite, title: "Wishlist"),
              listTile(icon: Icons.format_quote, title: "FAQs"),
            ],
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          title: Text(
            'Craft Bazaar',
            style: GoogleFonts.merienda(color: Colors.black, fontSize: 21.sp),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey.shade900),
          elevation: 1,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: CircleAvatar(
                radius: 18.sp,
                backgroundColor: const Color.fromARGB(121, 158, 158, 158),
                child: Icon(
                  Icons.search,
                  color: Colors.grey.shade900,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: CircleAvatar(
                radius: 18.sp,
                backgroundColor: const Color.fromARGB(121, 158, 158, 158),
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.grey.shade900,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const HomeBanner(),
              Padding(
                padding: EdgeInsets.all(12.0.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Madhubani Art',
                      style: TextStyle(fontSize: 17.sp),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(fontSize: 17.sp),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductOverview(
                              productName: 'Wall Art',
                              productPrice: 1999,
                              productImage: 'assets/madhubani/one.jpg',
                            ),
                          ),
                        );
                      },
                      child: ItemCard(
                        productImage: 'assets/madhubani/one.jpg',
                        productNAme: 'Wall Art',
                        productPrice: '1999',
                        onTap: () {},
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductOverview(
                              productName: 'Elephant Art',
                              productPrice: 550,
                              productImage: 'assets/madhubani/two.webp',
                            ),
                          ),
                        );
                      },
                      child: ItemCard(
                        productImage: 'assets/madhubani/two.webp',
                        productNAme: 'Elephant Art',
                        productPrice: '550',
                        onTap: () {},
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductOverview(
                              productName: 'Lamp',
                              productPrice: 1800,
                              productImage: 'assets/madhubani/three.jpg',
                            ),
                          ),
                        );
                      },
                      child: ItemCard(
                        productImage: 'assets/madhubani/three.jpg',
                        productNAme: 'Lamp',
                        productPrice: '1800',
                        onTap: () {},
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductOverview(
                              productName: 'Necklace',
                              productPrice: 400,
                              productImage: 'assets/madhubani/four.webp',
                            ),
                          ),
                        );
                      },
                      child: ItemCard(
                        productImage: 'assets/madhubani/four.webp',
                        productNAme: 'Necklace',
                        productPrice: '400',
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lights',
                      style: TextStyle(fontSize: 17.sp),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(fontSize: 17.sp),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ItemCard(
                      productImage: 'assets/madhubani/tree_lamp.jpg',
                      productNAme: 'Tree Lamp',
                      productPrice: '1800',
                      onTap: () {},
                    ),
                    ItemCard(
                      productImage: 'assets/madhubani/pendant_lamp.jpg',
                      productNAme: 'Pendant Lamp',
                      productPrice: '1300',
                      onTap: () {},
                    ),
                    ItemCard(
                      productImage: 'assets/madhubani/paper_lamps.webp',
                      productNAme: 'Paper Lamps',
                      productPrice: '1900',
                      onTap: () {},
                    ),
                    ItemCard(
                      productImage: 'assets/madhubani/glass_lamp.jpg',
                      productNAme: 'Glass Lamp',
                      productPrice: '999',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lights',
                      style: TextStyle(fontSize: 17.sp),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(fontSize: 17.sp),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ItemCard(
                      productNAme: 'Chitrakari Pots',
                      productPrice: '700',
                      productImage: 'assets/madhubani/plant1.png',
                      onTap: () {},
                    ),
                    ItemCard(
                      productNAme: 'Peacock Pot',
                      productPrice: '820',
                      productImage: 'assets/madhubani/plant2.png',
                      onTap: () {},
                    ),
                    ItemCard(
                      productNAme: 'Ceramic Pot',
                      productPrice: '600',
                      productImage: 'assets/madhubani/plant3.png',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
                image: AssetImage('assets/images/handicrafts.jpg'),
                fit: BoxFit.cover),
          ),
        ),
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: const Color.fromARGB(111, 0, 0, 0),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                'Crafted with Love',
                style: GoogleFonts.kalam(color: Colors.white, fontSize: 20),
              ),
              Text(
                'Cherished Forever',
                style: GoogleFonts.kalam(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget listTile({required IconData icon, required String title}) {
  return ListTile(
    leading: Icon(
      icon,
      size: 23.sp,
      color: Colors.grey.shade800,
    ),
    title: Text(
      title,
      style: const TextStyle(color: Colors.black),
    ),
  );
}
