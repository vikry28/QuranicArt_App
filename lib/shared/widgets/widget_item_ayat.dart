// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import '../../models/ayat_model.dart';
import '../../models/surah_model.dart';
import '../utils/colors.dart';

class WidgetItemAyat extends StatefulWidget {
  final Ayat ayat;
  final SurahModel surahModel;
  const WidgetItemAyat(
      {super.key, required this.ayat, required this.surahModel});

  @override
  State<WidgetItemAyat> createState() => _WidgetItemAyatState();
}

class _WidgetItemAyatState extends State<WidgetItemAyat> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 47.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
            ),
            decoration: BoxDecoration(
              color: greyColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 36.0,
                  width: 36.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/number.png',
                        ),
                        invertColors: false),
                  ),
                  child: Center(
                    child: Text(
                      widget.ayat.nomor.toString(),
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        await Share.share(
                          widget.ayat.ar +
                              "\n" +
                              widget.ayat.idn +
                              ' \n "QuranicArt by Stige IT"',
                          subject: 'Ayat',
                        );
                      },
                      icon: const Icon(
                        Icons.share,
                        size: 24.0,
                        color: whiteColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              widget.ayat.ar.toString(),
              textAlign: TextAlign.right,
              style: GoogleFonts.amiri(
                  color: whiteColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.ayat.tr,
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 14.0, color: greyColor),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  widget.ayat.idn,
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 14.0, color: whiteColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
