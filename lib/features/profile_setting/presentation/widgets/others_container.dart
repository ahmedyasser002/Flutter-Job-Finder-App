import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class OthersContainer extends StatelessWidget {
  String othersText;
  String svgUrl = AppAssets.svgUrl;
  OthersContainer(
      {super.key, required this.othersText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 24.w , left: 24.w , top: 6.h),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1.w, color: AppColors.neutral200))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(othersText , style: AppTextStyle.textLRegular(AppColors.neutral900),),
            SvgPicture.asset('${svgUrl}arrow-right.svg')
          ],
        ),
      ),
    );
  }
}
