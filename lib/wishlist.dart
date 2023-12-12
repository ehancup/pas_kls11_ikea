import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pas_kls11_ikea/components/wishlist_comp.dart';
import 'package:pas_kls11_ikea/modal/wish_search.dart';
import 'package:pas_kls11_ikea/themes/themes.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  static List<WishListSearch> wish_list = [
    WishListSearch(
        'alex.png', 'ALEX', 1350000, 'Unit laci, abu-abu toska, \n36x70 cm'),
    WishListSearch('millberget.png', 'MILLBERGET', 1350000,
        'Unit laci, abu-abu toska, \n36x70 cm'),
    WishListSearch('songesand.png', 'SONGESAND', 1350000,
        'Unit laci, abu-abu toska, \n36x70 cm'),
    WishListSearch('hektar.png', 'HEKTAR', 1350000,
        'Unit laci, abu-abu toska, \n36x70 cm'),
  ];

  List<WishListSearch> display_list = List.of(wish_list);
  bool _isFound = true;

  bool _isSearch = false;
  String kata = '';

  void handleSearch(String value) {
    setState(() {
      kata = value;
      display_list = wish_list
          .where((element) =>
              element.title.toLowerCase().contains(kata.toLowerCase()))
          .toList();

      _isFound = display_list.isNotEmpty;
    });
  }

  void handleShowSearch() {
    setState(() {
      _isSearch = true;
    });
  }

  void handleHideSearch() {
    setState(() {
      _isSearch = false;
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
      display_list = List.of(wish_list);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wishlist',
          style: interTitleBig,
        ),
        actions: [
          _isSearch
              ? const SizedBox()
              : GestureDetector(
                  onTap: handleShowSearch,
                  child: Icon(
                    Iconsax.search_normal_14,
                    size: 26,
                  )),
          const SizedBox(
            width: 24,
          ),
          const Icon(
            Iconsax.shopping_cart4,
            size: 26,
          ),
          const SizedBox(
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
                top: _isSearch ? 90 : 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: wish_list.length.toString(),
                                  style: interTitleMed),
                              TextSpan(text: ' barang', style: interSubItem),
                            ]),
                          ),
                          Icon(
                            Iconsax.menu5,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: _isFound
                          ? ListView.builder(
                              itemCount: display_list.length,
                              itemBuilder: (context, index) => item(
                                  display_list[index].image,
                                  display_list[index].title,
                                  display_list[index].desc,
                                  display_list[index].harga,
                                  context),
                            )
                          : Center(
                              child: Text('data tidak ditemukan'),
                            ),
                    )
                  ],
                )),
            searchBar(_isSearch, handleHideSearch, handleSearch)
          ],
        ),
      ),
    );
  }
}
