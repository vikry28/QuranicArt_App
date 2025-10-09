import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../models/bacaan_sholat_model.dart';
import '../../../shared/utils/colors.dart';
import '../../../shared/utils/next_screen.dart';
import '../../../shared/widgets/custom_prayer.dart';

class BacaanSholatScreen extends StatefulWidget {
  const BacaanSholatScreen({super.key});

  @override
  State<BacaanSholatScreen> createState() => _BacaanSholatScreenState();
}

class _BacaanSholatScreenState extends State<BacaanSholatScreen> {
  Future<List<BacaanSholatModel>> _getBacaanSholat() async {
    String data =
        await rootBundle.loadString('assets/datas/list_bacaan_sholat.json');

    return bacaanSholatModelFromJson(data);
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
          "Bacaan Sholat",
          style: TextStyle(color: whiteColor),
        ),
      ),
      body: FutureBuilder(
        future: _getBacaanSholat(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return ListView.separated(
              itemBuilder: (context, index) {
                return _itemBacaanSholat(
                    bacaanSholatModel: snapshot.data!.elementAt(index),
                    context: context);
              },
              separatorBuilder: (context, index) {
                return Container();
              },
              itemCount: snapshot.data!.length);
        },
      ),
    );
  }

  Widget _itemBacaanSholat(
      {required BacaanSholatModel bacaanSholatModel,
      required BuildContext context}) {
    return CustomPrayer(
        id: bacaanSholatModel.id,
        title: bacaanSholatModel.name,
        arab: bacaanSholatModel.arabic,
        latin: bacaanSholatModel.latin,
        terjemah: bacaanSholatModel.terjemahan);
  }
}
