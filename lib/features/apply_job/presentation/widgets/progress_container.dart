import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ProgressContainer extends StatelessWidget {
  bool isTurn;
  String stepNo;

  ProgressContainer({super.key, required this.isTurn , required this.stepNo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.w,
      height: 44.h,
      decoration: BoxDecoration(
          border: Border.all(width: 1.w, color: isTurn? AppColors.primary500 : AppColors.neutral400),
          shape: BoxShape.circle),
      child: Center(
        child: Text(
          stepNo,
          style: AppTextStyle.textLMedium(isTurn? AppColors.primary500 : AppColors.neutral400),
          
          ),
          ),
    );
  }
}
