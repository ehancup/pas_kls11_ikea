import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pas_kls11_ikea/themes/themes.dart';

AppBar navbar(BuildContext context) {
  return AppBar(
    surfaceTintColor: const Color(0xff00b41f),
    title: Text(
      'Temukan inspirasi',
      style: interTitleBig,
    ),
    actions: [
      Icon(Iconsax.search_normal_14),
      SizedBox(
        width: 24,
      ),
      Icon(Iconsax.shopping_cart4),
      SizedBox(
        width: 24,
      )
    ],
    bottom: TabBar(
      labelStyle: interTab,
      labelColor: Color(0xff1b1b1b),
      unselectedLabelColor: Color(0xff6C6C6C),
      // indicatorPadding: EdgeInsets.symmetric(horizontal: 8),
      unselectedLabelStyle: interTabItem,
      indicatorColor: tabIndicator,
      // tabAlignment: TabAlignment.start,

      // indicatorWeight: 3,
      padding: EdgeInsets.only(right: 132),
      tabs: [
        Tab(
          child: Text(
            'Inspirasi',
            style: interTabItem,
          ),
        ),
        Tab(
          child: Text(
            'Koleksi',
            style: interTabItem,
          ),
        ),
        Tab(
          child: Text(
            'Edukasi',
            style: interTabItem,
          ),
        ),
      ],
    ),
  );
}

Widget card(String imageAddress, String title) {
  return Container(
    width: 200,
    margin: EdgeInsets.only(bottom: 24),
    child: Column(
      children: [
        Image.asset(
          'assets/inspirasi/$imageAddress',
          height: 120,
          width: 200,
          alignment: Alignment.center,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          title,
          style: interItem,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
      ],
    ),
  );
}

Widget button(int index, int stateIndex, String title,
    void Function(int index) setButton) {
  bool clicked = index == stateIndex;
  return ElevatedButton(
    onPressed: () => setButton(index),
    child: Text(
      title,
      style: GoogleFonts.inter(
          color: clicked ? Colors.white : Color(0xff1B1B1B),
          fontWeight: clicked ? FontWeight.w500 : FontWeight.w400),
    ),
    style: ElevatedButton.styleFrom(
        backgroundColor: clicked ? Color(0xff0058AB) : Color(0xffffffff),
        side: BorderSide(
            color: clicked ? Color(0xff0058AB) : Color(0xffE7E7E7), width: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
  );
}
