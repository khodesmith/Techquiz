// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:tech_quiz/constants/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.buttonText,
    super.key,
    this.textColor,
    this.backgroundColor,
    this.buttonWidth,
    this.onTap,
  });
  final String buttonText;
  final Color? textColor;
  final Color? backgroundColor;
  final double? buttonWidth;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        width: buttonWidth ?? 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(),
          color: backgroundColor ?? Colors.transparent,
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 15,
              color: textColor ?? kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
