// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../models/doa_puasa_model.dart';
import '../../../shared/utils/colors.dart';
import '../../../shared/widgets/custom_prayer.dart';

class DoaPuasaSreenDetails extends StatefulWidget {
  const DoaPuasaSreenDetails({super.key});

  @override
  State<DoaPuasaSreenDetails> createState() => _DoaPuasaSreenDetailsState();
}

class _DoaPuasaSreenDetailsState extends State<DoaPuasaSreenDetails> {
  Future<DoaPuasaModel> _getDoaPuasa() async {
    String data =
        await rootBundle.loadString('assets/datas/list_doa_puasa.json');
    return doaPuasaModelFromJson(data);
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
          "Do'a Puasa",
          style: TextStyle(color: whiteColor),
        ),
      ),
      body: FutureBuilder<DoaPuasaModel>(
        future: _getDoaPuasa(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return ListView.builder(
            itemCount: snapshot.data!.data.length,
            itemBuilder: (context, index) {
              return _itemNiatPuasa(
                  puasa: snapshot.data!.data.elementAt(index),
                  context: context);
            },
          );
        },
      ),
    );
  }

  Widget _itemNiatPuasa({required Puasa puasa, required BuildContext context}) {
    return CustomPrayer(
        id: puasa.id,
        title: puasa.title,
        arab: puasa.arabic,
        latin: puasa.latin,
        terjemah: puasa.translation);
  }
}
