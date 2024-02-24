import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class InterestedWorkContainer extends StatelessWidget {
  String iconName = '';
  String containerText = '';
  Color color;
  Color borderColor;
  Color avatarContainerColor;
  void Function()? onTap;
  InterestedWorkContainer(
      {super.key,
      required this.iconName,
      required this.containerText,
      required this.onTap,
      required this.color,
      required this.avatarContainerColor,
      required this.borderColor});

  String svgUrl = AppAssets.svgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 125.h
      ),
      width: 156.w,
      padding: EdgeInsets.fromLTRB(14.w, 20.h, 14.w, 20.h),
      decoration: BoxDecoration(
          // color: Color(0xFFFAFAFA),
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
          border: Border.all(width: 1, color: borderColor)),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48.w,
              height: 48.h,
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
              decoration: BoxDecoration(
                color: avatarContainerColor,
                  border: Border.all(width: 1, color: borderColor),
                  borderRadius: const BorderRadius.all(Radius.circular(100))),
              child: SvgPicture.asset(
                '$svgUrl$iconName',
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: Text(
                containerText,
                style: AppTextStyle.textLRegular(AppColors.neutral900),
              ),
            )
          ],
        ),
      ),
    );
  }
}
