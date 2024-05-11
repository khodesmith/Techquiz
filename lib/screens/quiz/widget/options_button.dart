// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:tech_quiz/constants/app_colors.dart';

class OptionButtonWidget extends StatelessWidget {
  const OptionButtonWidget({
    required this.optionsText,
    required this.color,
    super.key,
  });
  final String optionsText;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: kPrimaryColor,
        ),
      ),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          optionsText,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
