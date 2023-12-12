import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pas_kls11_ikea/inspirasi.dart';
// import 'package:pas_kls11_ikea/main.dart';
import 'package:pas_kls11_ikea/home.dart';
import 'package:pas_kls11_ikea/wishlist.dart';
import 'package:pas_kls11_ikea/profile.dart';

class Pagination extends StatefulWidget {
  const Pagination({super.key});

  @override
  State<Pagination> createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  int _currentIndex = 0;
  List<Widget> body = [HomePage(), Inspirasi(), Cart(), Profile()];
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: body,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        unselectedItemColor: Color(0xff6C6C6C),
        selectedItemColor: Theme.of(context).colorScheme.primary ,
        // showUnselectedLabels: true,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
            _pageController.animateToPage(value,
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Iconsax.home), label: 'Beranda'),
          BottomNavigationBarItem(
            icon: Icon(
              Iconsax.coffee4,
            ),
            label: 'Inspirasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Iconsax.heart,
            ),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Iconsax.user4,
            ),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
