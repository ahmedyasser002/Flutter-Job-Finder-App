import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class GeneralContainer extends StatelessWidget {
  String generalIcon;
  String generalText;
  String svgUrl = AppAssets.svgUrl;
  GeneralContainer(
      {super.key, required this.generalIcon, required this.generalText});

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
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100.r)),
                  color: AppColors.primary100),
                  child: SvgPicture.asset('$svgUrl$generalIcon'),
            ),
            SizedBox(
              width: 14.w,
            ),
            Text(generalText , style: AppTextStyle.textLRegular(AppColors.neutral900),),
            const Spacer(),
            SvgPicture.asset('${svgUrl}arrow-right.svg')
          ],
        ),
      ),
    );
  }
}
