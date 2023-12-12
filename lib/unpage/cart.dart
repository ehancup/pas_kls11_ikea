import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pas_kls11_ikea/themes/themes.dart';
import 'package:pas_kls11_ikea/components/cart_comp.dart';
import 'package:pas_kls11_ikea/modal/cart.modal.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  static List<CartModel> cartItems = [
    CartModel('alex.png', 'ALEX', 1350000, 'apaankek', 1),
    CartModel('mackapar.png', 'MACKAPAR', 1499000, 'apaankek', 1),
    CartModel('hektar.png', 'HEKTAR', 1299000, 'apaankek', 1),
    CartModel('millberget.png', 'MILLBERGET', 1799000, 'apaankek', 1),
    CartModel('songesand.png', 'SONGESAND', 3499000, 'apaankek', 1),
  ];
  List<CartModel> displayItems = List.of(cartItems);
  bool _isFound = true;

  int totalPrice = cartItems
      .map((e) => e.harga * e.quantity)
      .reduce((value, element) => value + element);

  void handlePlus(int index) {
    setState(() {
      cartItems[index].quantity++;
      totalPrice = cartItems
          .map((e) => e.harga * e.quantity)
          .reduce((value, element) => value + element);
    });
  }

  void handleMinus(int index) {
    if (cartItems[index].quantity < 2) return;
    setState(() {
      cartItems[index].quantity--;
      totalPrice = cartItems
          .map((e) => e.harga * e.quantity)
          .reduce((value, element) => value + element);
    });
  }

  void handleDelete(int index) {
    setState(() {
      cartItems.removeAt(index);
      _isFound = cartItems.isNotEmpty;
      if (cartItems.isNotEmpty) {
        totalPrice = cartItems
            .map((e) => e.harga * e.quantity)
            .reduce((value, element) => value + element);
      } else {
        totalPrice = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Keranjang',
          style: interTitleBig,
        ),
        actions: [
          Icon(
            Iconsax.heart4,
            size: 26,
          ),
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
                bottom: 110,
                top: 0,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: cartItems.length.toString(),
                                  style: interTitleMed),
                              TextSpan(text: ' barang', style: interSubItem),
                            ]),
                          ),
                          Text(
                            'Hapus semua',
                            style: interLinkMed,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: _isFound
                            ? ListView.builder(
                                itemCount: cartItems.length,
                                itemBuilder: (context, index) => item(
                                    index,
                                    cartItems[index].image,
                                    cartItems[index].title,
                                    cartItems[index].desc,
                                    cartItems[index].harga,
                                    context,
                                    cartItems[index].quantity,
                                    handlePlus,
                                    handleMinus,
                                    handleDelete),
                              )
                            : Center(
                                child: Text('Belum ada barang di keranjang', style: interSubItem,),
                              ))
                  ],
                )),
            bottom(totalPrice, cartItems.isNotEmpty)
          ],
        ),
      ),
    );
  }
}
