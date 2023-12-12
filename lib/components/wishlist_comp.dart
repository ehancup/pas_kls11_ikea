import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:pas_kls11_ikea/themes/themes.dart';

Widget searchBar(
    bool isOpen, Function funClose, void Function(String) funSearch) {
  return Positioned(
    top: isOpen ? 0 : -90,
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

Widget item(String image, String title, String desc, int price, BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 24),
    margin: EdgeInsets.only(top: 24),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/wishlist/$image',
          width: 99,
          height: 99,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: interItem,
                    ),
                    Icon(Icons.more_vert_rounded)
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  desc,
                  style: interSubItem,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 12,),
                Text(NumberFormat.currency(locale: 'id_ID', symbol: 'Rp').format(price), style: interItem,),
                SizedBox(height: 12,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: OutlinedButton(onPressed: () {}, child: Text('Tambah ke Keranjang', style: interButtonMed,), style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Color(0xff0058AB)
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                        
                    ),
                  
                  ),
                  
                  ),
                )

              ],
            ),
          ),
        )
      ],
    ),
  );
}
