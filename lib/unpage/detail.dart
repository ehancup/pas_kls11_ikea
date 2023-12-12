import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:pas_kls11_ikea/themes/themes.dart';
import 'package:pas_kls11_ikea/components/navbar.dart';

class DetailPage extends StatefulWidget {
  const DetailPage(
      {super.key,
      required this.title,
      required this.image,
      required this.price});

  final String title;
  final String image;
  final int price;

  @override
  State<DetailPage> createState() => _DetailState();
}

class _DetailState extends State<DetailPage> {
  int _total = 1;
  int _selectedImage = 0;
  bool _isLove = false;
  late List<String> _image = [
    widget.image,
    '2.png',
    '3.png',
    '4.png',
    '5.png',
    '6.jpg',
    '7.jpg'
  ];

  PageController _pageController = PageController();

  void handlePlus() {
    setState(() {
      _total++;
    });
  }

  void handleMinus() {
    if (_total > 1) {
      setState(() {
        _total--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          widget.title,
          style: interTitleBig,
        ),
        actions: const [
          Icon(Iconsax.search_normal_14),
          SizedBox(
            width: 24,
          ),
          Icon(Iconsax.share4),
          SizedBox(
            width: 24,
          ),
          Icon(Iconsax.shopping_cart4),
          SizedBox(
            width: 24,
          )
        ],
      ),
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 110,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 24),
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: _image.length,
                            onPageChanged: (value) {
                              setState(() {
                                _selectedImage = value;
                              });
                            },
                            pageSnapping: true,
                            itemBuilder: (context, index) {
                              return Image.asset(
                                'assets/item/${_image[index]}',
                                width: double.infinity,
                                height: double.infinity,
                              );
                            },
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      height: 64,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _image.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedImage = index;
                                _pageController.animateToPage(index,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease);
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 15),
                              padding: EdgeInsets.all(
                                  index == _selectedImage ? 2 : 0),
                              height: 64,
                              width: 64,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: index == _selectedImage
                                          ? Theme.of(context)
                                              .colorScheme
                                              .primary
                                          : Colors.white,
                                      width: index == _selectedImage ? 2 : 0)),
                              child:
                                  Image.asset('assets/item/${_image[index]}'),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                style: interBrand,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                'Meja, hijau muda/putih, 120x60 cm',
                                style: interSubBrand,
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isLove = !_isLove;
                              });
                            },
                            child: _isLove
                                ? Icon(
                                    Iconsax.heart5,
                                    size: 26,
                                    color: Colors.red,
                                  )
                                : Icon(
                                    Iconsax.heart4,
                                    size: 26,
                                  ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            NumberFormat.currency(locale: 'id_ID', symbol: 'Rp')
                                .format(widget.price),
                            style: interBrandPrice,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              Icon(
                                Iconsax.star_15,
                                size: 18,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Iconsax.star_15,
                                size: 18,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Iconsax.star_15,
                                size: 18,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Iconsax.star_15,
                                size: 18,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Iconsax.star_15,
                                size: 18,
                                color: Colors.yellow,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                '4.5 | Terjual 116',
                                style: interSubItem,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                      child: Text(
                          'Ruang terbatas bukan berarti Anda harus menolak belajar atau bekerja dari rumah. Meja ini memakan sedikit ruang lantai namun masih memiliki unit laci tempat Anda dapat menyimpan kertas dan barang penting lainnya.',
                          style: interDesc),
                    )
                  ],
                ),
              ),
            ),
            detailBottom(_total, handlePlus, handleMinus)
          ],
        ),
      ),
    );
  }
}
