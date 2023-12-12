import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pas_kls11_ikea/unpage/cart.dart';
import 'package:pas_kls11_ikea/themes/themes.dart';

Widget navbar(Function onClick, bool kata, BuildContext context) {
  return Positioned(
      top: 25,
      left: 0,
      right: 0,
      child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 84,
                child: Image.asset('assets/logoikea.png'),
              ),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        onClick();
                      },
                      child:
                          kata ? SizedBox() : Icon(Iconsax.search_normal_14)),
                  SizedBox(
                    width: 18,
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Iconsax.notification4,
                      )),
                  SizedBox(
                    width: 18,
                  ),
                  GestureDetector(
                      onTap: () =>  Navigator.push(context, MaterialPageRoute(
                        builder: (context) => CartPage(),
                      )), child: Icon(Iconsax.shopping_cart4)),
                ],
              )
            ],
          )));
}

Widget searchBar(
    bool isOpen, Function funClose, void Function(String) funSearch) {
  return Positioned(
    top: isOpen ? 90 : -90,
    right: 0,
    left: 0,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(color: Colors.white),
      width: double.maxFinite,
      child: TextField(
        onChanged: funSearch,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffe7e7e7), width: 1)),
            hintText: 'Search',
            hintStyle: interSubItem,
            prefixIcon: GestureDetector(child: Icon(Iconsax.search_normal_14)),
            suffixIcon: GestureDetector(
              child: Icon(Iconsax.close_circle4),
              onTap: () {
                funClose();
              },
            )),
      ),
    ),
  );
}

Widget detailBottom(
    int quantity, void Function() handlePlus, void Function() handleMinus) {
  return Positioned(
    right: 0,
    left: 0,
    bottom: 0,
    child: Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white30, width: 2)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
            width: 128,
            height: 56,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Color(0xffe7e7e7)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    handleMinus();
                  },
                  child: Icon(
                    Iconsax.minus4,
                    size: 26,
                    color: Color(0xffb4b4b4),
                  ),
                ),
                Text(
                  quantity.toString(),
                  style: interItem,
                ),
                GestureDetector(
                  onTap: () {
                    handlePlus();
                  },
                  child: Icon(
                    Iconsax.add4,
                    size: 26,
                    color: Color(0xff0058ab),
                  ),
                ),
              ],
            )),
        ElevatedButton(
          onPressed: () {},
          child: Text(
            'Tambah ke Keranjang',
            style: GoogleFonts.inter(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff0058AB),
              padding: EdgeInsets.symmetric(horizontal: 45, vertical: 19),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0))),
        )
      ]),
    ),
  );
}
