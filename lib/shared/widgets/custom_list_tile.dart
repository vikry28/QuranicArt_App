import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomListTile extends StatelessWidget {
  final String images;
  final String text;

  final Function() onTap;
  const CustomListTile(
      {super.key,
      required this.images,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: greyColor, width: 1),
        ),
      ),
      child: ListTile(
          hoverColor: yellowColor,
          leading: Image.asset(
            images,
            color: yellowColor,
            width: 26.0,
            height: 26.0,
          ),
          title: Text(
            text,
            style:
                const TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
          ),
          onTap: onTap),
    );
  }
}
