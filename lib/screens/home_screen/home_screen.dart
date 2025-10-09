import 'package:flutter/material.dart';
import 'package:quranicart/screens/home_screen/widget/header_home.dart';
import 'package:quranicart/screens/home_screen/widget/search_surah.dart';
import 'package:quranicart/screens/home_screen/widget/surah_tab.dart';

import '../../shared/utils/colors.dart';
import '../../shared/utils/next_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchQuery = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor,
        elevation: 0,
        // leading: Image.asset('assets/images/icon_quran.png'),
        title: const Text(
          "QuranicArt",
          style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              nextScreen(
                context,
                const SearchSurah(),
              );
            },
            icon: const Icon(
              Icons.search,
              color: greyColor,
            ),
          )
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const SliverToBoxAdapter(
            child: HeaderHome(),
          ),
        ],
        body: const SurahTab(),
      ),
    );
  }
}
