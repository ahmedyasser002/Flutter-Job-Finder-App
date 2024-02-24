import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';

// ignore: must_be_immutable
class InputLabel extends StatelessWidget {
  String label;

  InputLabel({super.key , required this.label});
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: label,
            style: AppTextStyle.textLRegular(AppColors.neutral900)
          ),
          const TextSpan(
            text: '*',
            style: TextStyle(
              color: AppColors.danger500, // Set your desired color for the asterisk
            ),
          ),
        ],
      ),
    );
  }
}
