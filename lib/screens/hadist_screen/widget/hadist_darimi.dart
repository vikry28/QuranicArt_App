import 'package:flutter/material.dart';

// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/services.dart';

import '../../../models/hadist_tarimi_model.dart';
import '../../../shared/utils/colors.dart';
import '../../../shared/utils/next_screen.dart';
import '../../../shared/widgets/custom_item_hadist.dart';

class HadistDarimiScreen extends StatefulWidget {
  const HadistDarimiScreen({super.key});

  @override
  State<HadistDarimiScreen> createState() => _HadistDarimiScreenState();
}

class _HadistDarimiScreenState extends State<HadistDarimiScreen> {
  Future<List<HadistTarimiModel>> _getHadistTarimi() async {
    final String data =
        await rootBundle.loadString('assets/datas/hadist_darimi.json');
    return hadistTarimiModelFromJson(data);
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
            "Hadist Darimi",
            style: TextStyle(color: whiteColor),
          ),
        ),
        body: FutureBuilder(
          future: _getHadistTarimi(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemBuilder: (context, index) {
                return _itemHadistTarimi(
                    hadistTarimiModel: snapshot.data!.elementAt(index),
                    context: context);
              },
            );
          },
        ));
  }

  Widget _itemHadistTarimi(
      {required HadistTarimiModel hadistTarimiModel,
      required BuildContext context}) {
    return CustomItemHadist(
        number: hadistTarimiModel.number,
        arab: hadistTarimiModel.arab,
        terjemah: hadistTarimiModel.id,
        share: hadistTarimiModel.id,
        share2: hadistTarimiModel.arab);
  }
}
