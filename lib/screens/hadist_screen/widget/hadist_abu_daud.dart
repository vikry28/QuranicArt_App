import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../models/hadist_abu_daud_model.dart';
import '../../../shared/utils/colors.dart';
import '../../../shared/utils/next_screen.dart';
import '../../../shared/widgets/custom_item_hadist.dart';

class HadistAbuDaudScreen extends StatefulWidget {
  const HadistAbuDaudScreen({super.key});

  @override
  State<HadistAbuDaudScreen> createState() => _HadistAbuDaudScreenState();
}

class _HadistAbuDaudScreenState extends State<HadistAbuDaudScreen> {
  Future<List<HadistAbuDaudModel>> _getHadistAbuDaud() async {
    final String data =
        await rootBundle.loadString('assets/datas/hadist_abu_daud.json');
    return hadistAbuDaudModelFromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
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
          "Hadist Abu Daud",
          style: TextStyle(color: whiteColor),
        ),
      ),
      body: FutureBuilder(
        future: _getHadistAbuDaud(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              return _itemHadistAbuDaud(
                  hadistAbuDaudModel: snapshot.data!.elementAt(index),
                  context: context);
            },
          );
        },
      ),
    );
  }

  Widget _itemHadistAbuDaud(
      {required HadistAbuDaudModel hadistAbuDaudModel,
      required BuildContext context}) {
    return CustomItemHadist(
        number: hadistAbuDaudModel.number,
        arab: hadistAbuDaudModel.arab,
        terjemah: hadistAbuDaudModel.id,
        share: hadistAbuDaudModel.id,
        share2: hadistAbuDaudModel.arab);
  }
}
