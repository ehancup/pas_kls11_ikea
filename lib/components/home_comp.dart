import 'package:flutter/material.dart';
import 'package:pas_kls11_ikea/themes/themes.dart';
import 'package:pas_kls11_ikea/unpage/detail.dart';
import 'package:intl/intl.dart';

Widget kategori(String imageAddress, String title) {
  return Container(
    margin: const EdgeInsets.only(bottom: 24),
    width: 130,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset('assets/$imageAddress'),
        const SizedBox(
          height: 6,
        ),
        Text(
          title,
          style: interTitleMed,
        )
      ],
    ),
  );
}

Widget barang(String imageAddress, String title, int harga, String sub, BuildContext context) {
  return GestureDetector(
    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(title: title, image: imageAddress, price: harga,))) ,
    child: Container(
      margin: const EdgeInsets.only(right: 24),
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/item/$imageAddress',
            width: 150,
            height: 150,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            title,
            style: interItem,
            overflow: TextOverflow.clip,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            sub,
            style: interSubItem,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            NumberFormat.currency(locale: 'id_ID', symbol: 'Rp').format(harga),
            style: interItem,
          )
        ],
      ),
    ),
  );
}

Widget card(int color, String imageAddress, String title, String sub) {
  return Container(
    width: 200,
    decoration: BoxDecoration(color: Color(color)),
    child: Column(children: [
      Image.asset('assets/card/$imageAddress' , height: 120, width: 200, alignment: Alignment.center,fit: BoxFit.cover,),
      Container(
        width: 190,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: interTitleWhiteBig,),
            const SizedBox(height: 6,),
            Text(sub, style: interWhiteSubItem)
          ],
        ),
      )
    ]),
  );
}
