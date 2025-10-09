import 'package:flutter/material.dart';

// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/services.dart';

import '../../../models/doa_model.dart';
import '../../../shared/utils/colors.dart';
import '../../../shared/widgets/custom_prayer.dart';

class DoaharianScreenDetails extends StatefulWidget {
  const DoaharianScreenDetails({super.key});

  @override
  State<DoaharianScreenDetails> createState() => _DoaharianScreenDetailsState();
}

class _DoaharianScreenDetailsState extends State<DoaharianScreenDetails> {
  Future<DoaHarianModel> _getDoa() async {
    String data =
        await rootBundle.loadString('assets/datas/list_doa_harian.json');
    return doaHarianModelFromJson(data);
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
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 24.0,
            color: whiteColor,
          ),
        ),
        title: const Text(
          "Do'a Harian",
          style: TextStyle(color: whiteColor),
        ),
        actions: const [],
      ),
      body: FutureBuilder<DoaHarianModel>(
        future: _getDoa(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return ListView.builder(
            itemCount: snapshot.data!.data.length,
            itemBuilder: (context, index) {
              return _itemDoaHarian(
                  doa: snapshot.data!.data.elementAt(index), context: context);
            },
          );
        },
      ),
    );
  }

  Widget _itemDoaHarian({required Doa doa, required BuildContext context}) {
    return CustomPrayer(
        id: doa.id,
        title: doa.title,
        arab: doa.arabic,
        latin: doa.latin,
        terjemah: doa.translation);
  }
}
