import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class TwoStepInst extends StatelessWidget {
  String icon;
  String inst;
  String svgUrl = AppAssets.svgUrl;
  TwoStepInst(
      {super.key, required this.icon, required this.inst});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      
      child: Row(
        children: [
          Container(
            width: 44.w,
            height: 44.h,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100.r)),
                color: AppColors.primary100),
                child: SvgPicture.asset('$svgUrl$icon'),
          ),
          SizedBox(
            width: 14.w,
          ),
          Text(inst , style: AppTextStyle.textMRegular(AppColors.neutral500),),
          
        ],
      ),
    );
  }
}
