import 'package:flutter/material.dart';
import 'package:quranicart/screens/prayer_screen/widget/bacaan_sholat.dart';
import 'package:quranicart/screens/prayer_screen/widget/doa_harian.dart';
import 'package:quranicart/screens/prayer_screen/widget/doa_puasa.dart';
import 'package:quranicart/screens/prayer_screen/widget/doa_setelah_sholat_dhuha.dart';
import 'package:quranicart/screens/prayer_screen/widget/niat_sholat_fardhu.dart';
import 'package:quranicart/screens/prayer_screen/widget/niat_sholat_sunnah.dart';

import '../../shared/utils/colors.dart';
import '../../shared/utils/next_screen.dart';
import '../../shared/widgets/custom_list_tile.dart';

class PrayerScreen extends StatelessWidget {
  const PrayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: const ImageIcon(
          AssetImage('assets/images/hand.png'),
          color: yellowColor,
        ),
        title: const Text(
          'Kumpulan Doa',
          style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  child: Image.asset(
                    'assets/images/prayer.png',
                    fit: BoxFit.cover,
                  )),
            ),
            CustomListTile(
              images: 'assets/images/hand.png',
              text: "Niat Sholat Fardhu",
              onTap: () {
                nextScreen(
                  context,
                  const NiatSholatFardhuScreen(),
                );
              },
            ),
            CustomListTile(
              images: 'assets/images/hand.png',
              text: "Niat Sholat Sunnah",
              onTap: () {
                nextScreen(
                  context,
                  const NiatSholatSunnahScreen(),
                );
              },
            ),
            CustomListTile(
              images: 'assets/images/hand.png',
              text: "Bacaan Sholat",
              onTap: () {
                nextScreen(
                  context,
                  const BacaanSholatScreen(),
                );
              },
            ),
            CustomListTile(
              images: 'assets/images/hand.png',
              text: "Do'a Puasa",
              onTap: () {
                nextScreen(
                  context,
                  const DoaPuasaSreenDetails(),
                );
              },
            ),
            CustomListTile(
              images: 'assets/images/hand.png',
              text: "Do'a Harian",
              onTap: () {
                nextScreen(
                  context,
                  const DoaharianScreenDetails(),
                );
              },
            ),
            CustomListTile(
              images: 'assets/images/hand.png',
              text: "Do'a Sholat Dhuha",
              onTap: () {
                nextScreen(
                  context,
                  const DoaSholatDhuha(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
