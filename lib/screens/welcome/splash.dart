import 'package:flutter/material.dart';
import 'package:quranicart/shared/utils/colors.dart';

import '../../shared/utils/next_screen.dart';
import 'navigations_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: backgroundColor,
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(150.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: backgroundColor,
                child: Column(
                  children: [
                    const Text(
                      "QuranicArt",
                      style: TextStyle(
                        fontSize: 28.0,
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Image.asset(
                      'assets/images/icon_quran.png',
                      width: 64.0,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    const Text(
                      "Tilawah, Murottal \n Terjemah, Tahfidz",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: greyColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  child: Image.asset(
                    'assets/images/splash.png',
                    height: 430.0,
                  ),
                ),
                Positioned(
                  bottom: -23,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      nextScreen(
                        context,
                        const NavigationScreen(),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40.0),
                      height: 56.0,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: const Center(
                        child: Text(
                          "Yu Di Mulai",
                          style: TextStyle(
                            fontSize: 24.0,
                            color: blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
