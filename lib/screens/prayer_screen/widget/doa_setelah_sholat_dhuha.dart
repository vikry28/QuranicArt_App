// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import '../../../shared/utils/colors.dart';

class DoaSholatDhuha extends StatelessWidget {
  const DoaSholatDhuha({super.key});
  final String title = 'Doa setelah sholat dhuha';
  final String arabic =
      'اَللَّهُمَّ إِنَّ الضُّحَاءَ ضُحَاؤُكَ وَالبَهَاءَ بَهَاؤُكَ وَالجَمَالَ جَمَالُكَ وَالقُوَّةَ قُوَّتُكَ وَالقُدْرَةَ قُدْرَتُكَ وَالعِصْمَةَ عِصْمَتُكَ اَللَّهُمَّ إِنْ كَانَ رِزْقِي فِي السَّمَاءِ فَأَنْزِلْهُ وَإِنْ كَانَ فِي الأَرْضِ فَأَخْرِجْهُ وَإِنْ كَانَ مُعْسِرًا فَيَسِّرْهُ وَإِنْ كَانَ حَرَامًا فَطَهِّرْهُ وَإِنْ كَانَ بَعِيْدًا فَقَرِّبْهُ بِحَقِّ ضُحَائِكَ وَبَهَائِكَ وَجَمَالِكَ وَقُوَّتِكَ وَقُدْرَتِكَ آتِنِي مَا آتَيْتَ عِبَادَكَ الصَّالِحِيْنَ اَللَّهُمَّ بِكَ أُصَاوِلُ وَبِكَ أُحَاوِلُ وَبِكَ أُقَاتِلُ  ثُمَّ يَقُوْلُ رَبِّ اغْفِرْ لِي وَارْحَمْنِي وَتُبْ عَلَيَّ إِنَّكَ أَنْتَ التَّوَّابُ الرَّحِيْ';

  final String latin =
      'Allâhumma innad dhuhâ’a dhuhâ’uka, wal bahâ’a bahâ’uka, wal jamâla jamâluka, wal quwwata quwwatuka, wal qudrata qudratuka, wal ‘ishmata ishmatuka. Allâhumma in kâna rizkî fis samâ’i, fa anzilhu. Wa in kâna fil ardhi, fa akhrijhu. Wa in kâna mu‘siron, fa yassirhu. Wa in kâna harâman, fa thahhirhu. Wa in kâna ba‘idan, fa qarribhu bi haqqi dhuhâ’ika, wa bahâ’ika, wa jamâlika, wa quwwatika, wa qudratika. Âtinî mâ âtaita ‘ibâakas shâlihîn. Allâhumma bika ushâwilu, wa bika uhâwilu, wa bika uqâtilu. Rabbighfir lî, warhamnî, watub ‘alayya. Innaka antat tawwâbur rahîm.';
  final String terjemah =
      'Tuhanku, sungguh waktu dhuha adalah milik-Mu. Yang ada hanya keagungan-Mu. Tiada lagi selain keindahan-Mu. Hanya ada kekuatan-Mu. Yang ada hanya kuasa-Mu. Tidak ada yang lain kecuali lindungan-Mu. Tuhanku, kalau rezekiku di langit, turunkanlah. Kalau berada di bumi, keluarkanlah. Kalau sulit, mudahkanlah. Kalau haram, gantilah jadi yang suci. Bila jauh, dekatkanlah dengan hakikat dhuha, keagungan, kekuatan, kekuasaan-Mu. Tuhanku, berikanlah aku apa yang Kau anugerahkan kepada hamba-hamba-Mu yang saleh. Tuhanku, dengan-Mu aku bergerak. Dengan-Mu aku berusaha. Dengan-Mu, aku berjuang. Tuhanku, ampunilah segala dosaku. Turunkan rahmat-Mu kepadaku. Anugerahkanlah tobat-Mu untukku. Sungguh Engkau maha penerima tobat, lagi maha penyayang.';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 24.0,
            color: whiteColor,
          ),
        ),
        title: const Text(
          "Do'a Sholat Dhuha",
          style: TextStyle(color: whiteColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
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
                      SizedBox(
                          width: MediaQuery.of(context).size.width - 100,
                          child: Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: whiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      GestureDetector(
                        onTap: () async {
                          await Share.share(
                            title +
                                "\n" +
                                arabic +
                                "\n" +
                                terjemah +
                                ' \n "QuranicArt by Stige IT"',
                            subject: 'Ayat',
                          );
                        },
                        child: const Icon(
                          Icons.share,
                          size: 24.0,
                          color: yellowColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      textAlign: TextAlign.right,
                      arabic,
                      style: GoogleFonts.amiri(
                        fontSize: 24.0,
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        latin,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: greyColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        terjemah,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: whiteColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
