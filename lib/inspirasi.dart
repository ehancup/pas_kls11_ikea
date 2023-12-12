import 'package:flutter/material.dart';
import 'package:pas_kls11_ikea/components/inspirasi_comp.dart';
import 'inspirasi_page/inpirasi.dart';

class Inspirasi extends StatefulWidget {
  const Inspirasi({super.key});

  @override
  State<Inspirasi> createState() => _InspirasiState();
}

class _InspirasiState extends State<Inspirasi> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: navbar(context),
          body: TabBarView(
            children: [
              InspirasiPage(),
              Center(
                child: Text('testing'),
              ),
              Center(
                child: Text('apaankek'),
              ),
            ],
          )),
    );
  }
}
