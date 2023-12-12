import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pas_kls11_ikea/components/profile_comp.dart';
import 'package:pas_kls11_ikea/themes/themes.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Akun', style: interTitleBig,),
        actions: [
          const Icon(Iconsax.setting_24, size: 26,),
          const SizedBox(width: 24,)
        ],
      ),
      body:SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(vertical: 24),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xffe7e7e7), width: 1)
                  )
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/qr.png', width: 84, height: 84,),
                    Container(
                      margin: const EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Raihan Yusuf Firmansyah', style: interItem,),
                          const SizedBox(height: 6,),
                          Text('160002359102020', style: interSubItem,)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              menu('Profil Saya', Iconsax.profile_circle4),
              menu('Pesanan', Iconsax.box4),
              menu('Ulasan', Iconsax.star_14),
              menu('Reward Saya', Iconsax.gift4),
              menu('Bantuan', Iconsax.message_question4),
            ],
          ),
        ),
      )
    );
  }
}