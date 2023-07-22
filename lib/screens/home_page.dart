import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      drawer: const Drawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          title: Text(
            'Boho Bazaar',
            style: GoogleFonts.merienda(color: Colors.black, fontSize: 21.sp),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey.shade900),
          elevation: 1,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const HomeBanner(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Madhubani Art',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  ItemCard(),
                  ItemCard(),
                  ItemCard(),
                  ItemCard(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Lights',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            ListView(
              children: const [
                ItemCard(),
                ItemCard(),
                ItemCard(),
                ItemCard(),
                ItemCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        height: 25.h,
        width: 40.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 15.h,
                width: 35.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/madhubani/one.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                'Wall Art',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
              ),
              Text(
                '₹ 1999',
                style: TextStyle(fontSize: 16.sp),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 3.h,
                      width: 18.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade900),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Add',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 3.h,
                      width: 16.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade900),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '- 1 +',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ),
                    ),
                  ),
                ],
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
