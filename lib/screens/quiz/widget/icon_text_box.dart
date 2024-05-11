// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:tech_quiz/constants/app_colors.dart';

class IconTextBox extends StatelessWidget {
  const IconTextBox({
    required this.iconImage,
    required this.boxText,
    super.key,
  });

  final String iconImage;
  final String boxText;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 10),
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey.shade400,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconImage,
            height: 50,
            width: 50,
          ),
          const SizedBox(height: 13),
          Text(
            boxText,
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
