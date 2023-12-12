import 'package:flutter/material.dart';
import 'package:pas_kls11_ikea/themes/themes.dart';

Widget menu(String title, IconData icon) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 24) ,
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Color(0xffe7e7e7), width: 1)
      ),
      
    ),
    child: Row(
      children: [
        Icon(icon, size: 26,),
        SizedBox(width: 16,),
        Text(title, style: interProfileMenu,)
      ],
    ),
  );
}
