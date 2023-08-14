import 'package:e_commerce_app/providers/product_provider.dart';
import 'package:e_commerce_app/providers/user_provider.dart';
import 'package:e_commerce_app/screens/my_profile.dart';
import 'package:e_commerce_app/screens/product_overview.dart';
import 'package:e_commerce_app/screens/review_cart.dart';
import 'package:e_commerce_app/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../widgets/item_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ProductProvider productProvider;

  @override
  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fetchMadhubaniArtData();
    productProvider.fetchLightData();
    productProvider.fetchFlowerPotData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    UserProvider userProvider = Provider.of(context);
    userProvider.getUserData();
    var userData = userProvider.currentUserData;
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
                      maxRadius: 25.sp,
                      backgroundImage: NetworkImage(userData!.userImage),
                    ),
                    SizedBox(
                      width: 14.sp,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(userData.userName,
                            style: (TextStyle(fontSize: 16.sp))),
                        Text(userData.userEmail,
                            style: (TextStyle(fontSize: 16.sp))),
                      ],
                    ),
                  ],
                ),
              ),
              listTile(
                icon: Icons.home,
                title: "Home",
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ReviewCart()));
                },
                child: listTile(icon: Icons.shop, title: "Review Cart"),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyProfile(userData:userData)));
                },
                child: listTile(icon: Icons.person, title: "My Profile"),
              ),
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
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Search(
                                  search: productProvider.getAllProducts,
                                  // search: productProvider.gerAllProductSearch,
                                )));
                  },
                  icon: const Icon(Icons.search),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Search(
                              search: productProvider.getMadhubaniArtList,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'View All',
                        style: TextStyle(fontSize: 17.sp),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: productProvider.getMadhubaniArtList.map((data) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductOverview(
                              productName: data.productName,
                              productPrice: data.productPrice,
                              productImage: data.productImage,
                            ),
                          ),
                        );
                      },
                      child: ItemCard(
                        productId: data!.productId,
                        productImage: data.productImage,
                        productNAme: data.productName,
                        productPrice: data.productPrice.toString(),
                        onTap: () {},
                      ),
                    );
                  }).toList(),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Search(
                              search: productProvider.getLightList,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'View All',
                        style: TextStyle(fontSize: 17.sp),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: productProvider.getLightList.map((data) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductOverview(
                              productName: data.productName,
                              productPrice: data.productPrice,
                              productImage: data.productImage,
                            ),
                          ),
                        );
                      },
                      child: ItemCard(
                        productId: data!.productId,
                        productImage: data.productImage,
                        productNAme: data.productName,
                        productPrice: data.productPrice.toString(),
                        onTap: () {},
                      ),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Flower Pots',
                      style: TextStyle(fontSize: 17.sp),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Search(
                              search: productProvider.getflowerPotList,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'View All',
                        style: TextStyle(fontSize: 17.sp),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: productProvider.getflowerPotList.map((data) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductOverview(
                              productName: data.productName,
                              productPrice: data.productPrice,
                              productImage: data.productImage,
                            ),
                          ),
                        );
                      },
                      child: ItemCard(
                        productId: data!.productId,
                        productImage: data.productImage,
                        productNAme: data.productName,
                        productPrice: data.productPrice.toString(),
                        onTap: () {},
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
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
