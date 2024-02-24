import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class JobTypeContainer extends StatelessWidget {
  String jobType;
  Color color;
  double horizontalPadding;
  JobTypeContainer({super.key, required this.jobType, required this.color , required this.horizontalPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: horizontalPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100.r)),
        color: color,
      ),
      child: Text(
        jobType,
        style: AppTextStyle.textSRegular(color == AppColors.primary100
            ? AppColors.primary500
            : const Color(0xFFFFFFFF)),
      ),
    );
  }
}
