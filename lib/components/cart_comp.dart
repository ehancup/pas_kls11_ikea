import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:pas_kls11_ikea/themes/themes.dart';
import 'package:google_fonts/google_fonts.dart';

Widget item(
    int index,
    String image,
    String title,
    String desc,
    int price,
    BuildContext context,
    int quantity,
    void Function(int index) handlePlus,
    void Function(int index) handleMinus,
    void Function(int index) handleDelete) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 24),
    margin: EdgeInsets.only(bottom: 24),
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
                Text(
                  title,
                  style: interItem,
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
                SizedBox(
                  height: 12,
                ),
                Text(
                  NumberFormat.currency(locale: 'id_ID', symbol: 'Rp')
                      .format(price),
                  style: interItem,
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => handleDelete(index),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 26),
                            margin: EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Color(0xffe7e7e7),
                              width: 1,
                            )),
                            height: 38,
                            child: Icon(Iconsax.trash4),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 38,
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 9),
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Color(0xffe7e7e7),
                              width: 1,
                            )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => handleMinus(index),
                                  child: Icon(
                                    Iconsax.minus4,
                                    color: Color(0xffB4B4B4),
                                  ),
                                ),
                                Text(quantity.toString()),
                                GestureDetector(
                                  onTap: () => handlePlus(index),
                                  child: Icon(
                                    Iconsax.add4,
                                    color: Color(0xff0058AB),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget bottom(int total, bool _isDisable) {
  return Positioned(
    bottom: 0,
    right: 0,
    left: 0,
    child: Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white30, width: 2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(right: 69),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total',
                  style: interSubItem,
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  NumberFormat.currency(locale: 'id_ID', symbol: 'Rp')
                      .format(total),
                  style: interTotal,
                )
              ],
            ),
          ),
          Container(
              width: 181,
              child: ElevatedButton(
                onPressed: _isDisable ? () {} : null,
                child: Text(
                  'Beli',
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _isDisable ? Color(0xff0058AB) : Color(0xff6c6c6c),
                    padding: EdgeInsets.symmetric(vertical: 19),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0))),
              ))
        ],
      ),
    ),
  );
}
