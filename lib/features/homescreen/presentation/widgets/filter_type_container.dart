import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class FilterTypeContainer extends StatelessWidget {
  var svgUrl = AppAssets.svgUrl;
  bool? containerColor;
  String filterType;
  void Function() onPressed;

  FilterTypeContainer(
      {super.key, required this.filterType, this.containerColor , required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 32,
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 14.w),
        decoration: BoxDecoration(
            border: containerColor == null
                ? null
                : Border.all(width: 1.w, color: AppColors.neutral300),
            borderRadius: BorderRadius.all(Radius.circular(1000.r)),
            color: containerColor == null
                ? AppColors.primary900
                : const Color(0xFFFFFFFF)),
        child: Row(
          children: [
            Text(
              filterType,
              style: AppTextStyle.textSMedium(containerColor == null
                  ? const Color(0xFFFFFFFF)
                  : AppColors.neutral500),
            ),
            SizedBox(width: 4.w),
            SvgPicture.asset(containerColor == null
                ? '${svgUrl}arrow-down.svg'
                : '${svgUrl}neutral-arrow-down.svg')
          ],
        ),
      ),
    );
  }
}
