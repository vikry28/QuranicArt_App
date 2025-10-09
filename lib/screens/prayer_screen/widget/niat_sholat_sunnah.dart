import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../models/niat_sholat_sunnah_model.dart';
import '../../../shared/utils/colors.dart';
import '../../../shared/utils/next_screen.dart';
import '../../../shared/widgets/custom_prayer.dart';

class NiatSholatSunnahScreen extends StatefulWidget {
  const NiatSholatSunnahScreen({super.key});

  @override
  State<NiatSholatSunnahScreen> createState() => _NiatSholatSunnahScreenState();
}

class _NiatSholatSunnahScreenState extends State<NiatSholatSunnahScreen> {
  Future<List<NiatSholatSunnahModel>> _getNiatSholatSunnah() async {
    final String data =
        await rootBundle.loadString('assets/datas/niat_sholat_sunnah.json');
    return niatSholatSunnahFromJson(data);
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
          "Niat Sholat Sunnah",
          style: TextStyle(color: whiteColor),
        ),
      ),
      body: FutureBuilder<List<NiatSholatSunnahModel>>(
        future: _getNiatSholatSunnah(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return _itemNiatSholatSunnah(
                  niatSholatSunnahModel: snapshot.data!.elementAt(index),
                  context: context);
            },
          );
        },
      ),
    );
  }

  Widget _itemNiatSholatSunnah(
      {required NiatSholatSunnahModel niatSholatSunnahModel,
      required BuildContext context}) {
    return CustomPrayer(
        id: niatSholatSunnahModel.nomor,
        title: niatSholatSunnahModel.title,
        arab: niatSholatSunnahModel.arab,
        latin: niatSholatSunnahModel.latin,
        terjemah: niatSholatSunnahModel.terjemah);
  }
}
