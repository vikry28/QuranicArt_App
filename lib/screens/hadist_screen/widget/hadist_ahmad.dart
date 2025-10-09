import 'package:flutter/material.dart';

// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/services.dart';

import '../../../models/hadist_ahmad_model.dart';
import '../../../shared/utils/colors.dart';
import '../../../shared/utils/next_screen.dart';
import '../../../shared/widgets/custom_item_hadist.dart';

class HadistAhmadScreen extends StatefulWidget {
  const HadistAhmadScreen({super.key});

  @override
  State<HadistAhmadScreen> createState() => _HadistAhmadScreenState();
}

class _HadistAhmadScreenState extends State<HadistAhmadScreen> {
  Future<List<HadistAhmadModel>> _getHadistAhmad() async {
    final String data =
        await rootBundle.loadString('assets/datas/hadist_ahmad.json');
    return hadistAhmadModelFromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            popScreen(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 24.0,
            color: greyColor,
          ),
        ),
        title: const Text(
          "Hadist Ahmad",
          style: TextStyle(color: whiteColor),
        ),
      ),
      body: FutureBuilder(
        future: _getHadistAhmad(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              return _itemHadistAhmad(
                  hadistAhmadModel: snapshot.data!.elementAt(index),
                  context: context);
            },
          );
        },
      ),
    );
  }

  Widget _itemHadistAhmad(
      {required HadistAhmadModel hadistAhmadModel,
      required BuildContext context}) {
    return CustomItemHadist(
        number: hadistAhmadModel.number,
        arab: hadistAhmadModel.arab,
        terjemah: hadistAhmadModel.id,
        share: hadistAhmadModel.id,
        share2: hadistAhmadModel.arab);
  }
}
