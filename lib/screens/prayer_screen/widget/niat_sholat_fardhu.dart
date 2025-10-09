import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../models/niat_sholat_model.dart';
import '../../../shared/utils/colors.dart';
import '../../../shared/utils/next_screen.dart';
import '../../../shared/widgets/custom_prayer.dart';

class NiatSholatFardhuScreen extends StatefulWidget {
  const NiatSholatFardhuScreen({super.key});

  @override
  State<NiatSholatFardhuScreen> createState() => _NiatSholatFardhuScreenState();
}

class _NiatSholatFardhuScreenState extends State<NiatSholatFardhuScreen> {
  Future<List<NiatSholatModel>> _getNiatSholat() async {
    String data =
        await rootBundle.loadString('assets/datas/list_niat_sholat.json');

    return niatSholatModelFromJson(data);
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
          "Niat Sholat Fardhu",
          style: TextStyle(color: whiteColor),
        ),
      ),
      body: FutureBuilder(
        future: _getNiatSholat(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return ListView.separated(
              itemBuilder: (context, index) {
                return _itemNiatSholatFardhu(
                    niatSholatModel: snapshot.data!.elementAt(index),
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

  Widget _itemNiatSholatFardhu(
      {required NiatSholatModel niatSholatModel,
      required BuildContext context}) {
    return CustomPrayer(
        id: niatSholatModel.id,
        title: niatSholatModel.name,
        arab: niatSholatModel.arabic,
        latin: niatSholatModel.latin,
        terjemah: niatSholatModel.terjemahan);
  }
}
