import 'package:flutter/material.dart';
import 'package:pas_kls11_ikea/themes/themes.dart';
import 'components/home_comp.dart';
import 'components/navbar.dart';
import 'package:pas_kls11_ikea/modal/item_search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<ItemSearchModal> listSearch = [
    ItemSearchModal('KROKFJORDEN'),
    ItemSearchModal('testing apa ahja kek'),
  ];

  String kata = 'apakek';
  bool _showTextField = true;
  bool fun = true;
  bool resultsFounds = true;
  List<ItemSearchModal> displaySearch = List.of(listSearch);

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final double currentScroll = _scrollController.position.pixels;
    if (currentScroll > 20 && _showTextField) {
      setState(() {
        _showTextField = false;
        fun = false;
      });
    } else if (currentScroll <= 20 && !_showTextField) {
      setState(() {
        _showTextField = true;
        fun = true;
      });
    }
  }

  void UpdateListSearch(String value) {
    setState(() {
      displaySearch = listSearch
          .where((element) =>
              element.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
      resultsFounds = displaySearch.isNotEmpty;
      kata = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    void _onClick() {
      setState(() {
        fun = true;
      });
    }

    void searchClose() {
      setState(() {
        fun = false;
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      });
    }

    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              top: fun ? 140 : 90,
              left: 0,
              right: 0,
              bottom: 0,
              child: CustomScrollView(controller: _scrollController, slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Image.asset(
                              'assets/topPage.png',
                              width: double.maxFinite,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 24),
                            width: double.maxFinite,
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              children: [
                                kategori('kamar.png', 'Kamar Tidur'),
                                kategori('rkerja.png', 'Ruang Kerja'),
                                kategori('dapur.png', 'Dapur'),
                                kategori('bayi.png', 'Bayi & Anak'),
                                kategori('tekstil.png', 'Tekstil'),
                                kategori('penyimpanan.png', kata),
                              ],
                            ),
                          ),
                          Container(
                            margin:
                                const EdgeInsets.only(right: 24, left: 24, top: 24),
                            width: double.maxFinite,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Produk Populer',
                                  style: interTitleBig,
                                ),
                                Text(
                                  'Lihat Semua',
                                  style: interLinkMed,
                                )
                              ],
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 16),
                              // padding: EdgeInsets.only(left: 24),
                              width: double.maxFinite,
                              height: 280,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  const SizedBox(
                                    width: 24,
                                  ),
                                  barang(
                                      'gantungan.png',
                                      'KROKFJORDEN',
                                      4000,
                                      'apaan kek yg penting panjang aja ga ush banyak bayank',
                                      context),
                                  barang(
                                      'meja.png',
                                      'ALEX/LAGKAPTEN',
                                      4000,
                                      'apaan kek yg penting panjang aja ga ush banyak bayank',
                                      context),
                                  barang(
                                      'lemari.png',
                                      'FARDAL/PAX',
                                      4000,
                                      'apaan kek yg penting panjang aja ga ush banyak bayank',
                                      context),
                                ],
                              )),
                          Container(
                            margin:
                                const EdgeInsets.only(right: 24, left: 24, top: 24),
                            width: double.maxFinite,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Telusuri Koleksi Kami',
                                  style: interTitleBig,
                                ),
                                Text(
                                  'Lihat Semua',
                                  style: interLinkMed,
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                            width: double.maxFinite,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  card(0xff4F707F, 'aqua.png', 'BLÅVINGAD',
                                      'Koleksi yang terinspirasi dari lautan untuk menciptakan ...'),
                                  card(0xff5E4238, 'peopli.png', 'VINTERFINT',
                                      'Koleksi VINTERFINT hadir dengan warna dan pola indah ...')
                                ]),
                          ),
                          Container(
                            margin:
                                const EdgeInsets.only(right: 24, left: 24, top: 24),
                            width: double.maxFinite,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Penawaran Terkini',
                                  style: interTitleBig,
                                ),
                                Text(
                                  'Lihat Semua',
                                  style: interLinkMed,
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/berita/berita1.png',
                                  width: 200,
                                ),
                                Image.asset(
                                  'assets/berita/berita2.png',
                                  width: 200,
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ]),
            ),
            navbar(_onClick, fun, context),
            searchBar(fun, searchClose, UpdateListSearch)
          ],
        ),
      ),
    );
  }
}
