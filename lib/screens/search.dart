import 'package:e_commerce_app/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'single_item.dart';

enum SinginCharacter { lowToHigh, highToLow, alphabetically }

class Search extends StatefulWidget {
  List<ProductModel?> search;
  Search({super.key, required this.search});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = '';
  SinginCharacter _character = SinginCharacter.alphabetically;

  // Search item from the list provided in constructor
  List<ProductModel?> searchItem(String query) {
    List<ProductModel?> searchFood = widget.search.where((element) {
      return element!.productName.toLowerCase().contains(query);
    }).toList();
    return searchFood;
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel?> _searchItem = searchItem(query);
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text(
          "Total Amount",
          style: TextStyle(
            color: Colors.grey.shade900,
            fontSize: 16.sp,
          ),
        ),
        subtitle: Text(
          "1999",
          style: TextStyle(
              color: Colors.grey.shade900,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold),
        ),
        trailing: SizedBox(
          width: 40.w,
          child: OutlinedButton(
            onPressed: () {},
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.sp),
                ),
              ),
            ),
            child: Text(
              "Next",
              style: TextStyle(color: Colors.grey.shade900, fontSize: 16.5.sp),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 20.sp,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        title: Text(
          'Search',
          style: GoogleFonts.merienda(
            color: Colors.black,
            fontSize: 17.sp,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 6.h,
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            child: TextField(
              //onChanged and not controller since we want string and not controller return type
              onChanged: (value) {
                print(value);
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.grey.shade900),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: "Search for items in the store",
                suffixIcon: Icon(
                  Icons.search,
                  size: 20.sp,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 1.2.h,
          ),
          Column(
            children: _searchItem.map((data) {
              return SingleItem(
                isBool: false,
                productImage: data!.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
