import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HelpContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var svgUrl = AppAssets.svgUrl;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          border: Border.all(width: 1.w, color: AppColors.neutral300)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Lorem ipsum dolor sit amet',
            style: AppTextStyle.textLMedium(AppColors.neutral900),
          ),
          SvgPicture.asset('${svgUrl}black-arrow-down.svg')
        ],
      ),
    );
  }
}
