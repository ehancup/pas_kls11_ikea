import 'package:flutter/material.dart';
import 'package:pas_kls11_ikea/components/inspirasi_comp.dart';
import 'package:pas_kls11_ikea/themes/themes.dart';

class InspirasiPage extends StatefulWidget {
  const InspirasiPage({super.key});

  @override
  State<InspirasiPage> createState() => _InspirasiPageState();
}

class _InspirasiPageState extends State<InspirasiPage> {
  int _selectedButton = 0;

  void updateButtonIndex(int index) {
    setState(() {
      _selectedButton = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 24),
            height: 50,
            width: double.maxFinite,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(
                  width: 24,
                ),
                button(0, _selectedButton, 'Semua', updateButtonIndex),
                const SizedBox(
                  width: 16,
                ),
                button(1, _selectedButton, 'Ruang Kerja', updateButtonIndex),
                const SizedBox(
                  width: 16,
                ),
                button(2, _selectedButton, 'Dapur', updateButtonIndex),
                const SizedBox(
                  width: 16,
                ),
                button(3, _selectedButton, 'Ruang Keluarga', updateButtonIndex),
                const SizedBox(
                  width: 24,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            width: double.maxFinite,
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: [
                card('hunian.png', 'Hunian compact yang nyaman'),
                card('rak.png',
                    'Lakukan 5 hal ini agar sepatumu bebas dari gangguan'),
                Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(bottom: 24),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/inspirasi/turu.png',
                        height: 120,
                        width: double.maxFinite,
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Hadirkan nuasa elegant dan fancy kedalam kamar tidur anda',
                        style: interItem,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                card('sabun.png', 'Rumah lebih sehat dengan set tempat sabun yang higienis'),
                card('anak.png', 'Membuat kamar anak rapi jadi lebih mudah')
              ],
            ),
          )
        ],
      ),
    ));
  }
}
