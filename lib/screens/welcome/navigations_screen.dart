import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../../shared/utils/colors.dart';
import '../hadist_screen/hadist_screen.dart';
import '../home_screen/home_screen.dart';
import '../prayer_screen/prayer.dart';
import '../prayer_times_screen/prayer_times_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  // late BannerAd _bottomBannerAd;
  // bool _isBottomBannerAdLoaded = false;
  // void _createBannerBannerAd() {
  //   _bottomBannerAd = BannerAd(
  //     size: AdSize.banner,
  //     adUnitId: AdHelpers.bannerAddUnitId,
  //     listener: BannerAdListener(
  //       onAdLoaded: (_) {
  //         setState(() {
  //           _isBottomBannerAdLoaded = true;
  //         });
  //       },
  //       onAdFailedToLoad: (ad, error) {
  //         ad.dispose();
  //       },
  //     ),
  //     request: const AdRequest(),
  //   );
  //   _bottomBannerAd.load();
  // }

  @override
  void initState() {
    super.initState();
    // _createBannerBannerAd();
  }

  @override
  void dispose() {
    // _createBannerBannerAd();
    super.dispose();
  }

//index
  late int _selectedIdex = 0;
  late final screen = [
    const HomeScreen(),
    const HadistScreen(),
    const PrayerTimeScreen(),
    const PrayerScreen(),
  ];

  void _selectedScreen(int index) {
    setState(() {
      _selectedIdex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screen[_selectedIdex],
        bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          backgroundColor: backgroundColor,
          buttonBackgroundColor: yellowColor.withOpacity(.9),
          onTap: _selectedScreen,
          color: const Color(0XFF121931),
          items: const <Widget>[
            ImageIcon(
              AssetImage('assets/images/home.png'),
              color: whiteColor,
            ),
            ImageIcon(
              AssetImage('assets/images/lamp.png'),
              color: whiteColor,
            ),
            ImageIcon(
              AssetImage('assets/images/people.png'),
              color: whiteColor,
            ),
            ImageIcon(
              AssetImage('assets/images/hand.png'),
              color: whiteColor,
            ),
          ],
        ));
  }
}
