import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CountryContainer extends StatelessWidget {
  String countryFlag;
  String countryName;
  Color containerColor;
  void Function() onTap;
  Color borderColor;
  CountryContainer(
      {super.key,
      required this.countryFlag,
      required this.countryName,
      required this.onTap,
      required this.containerColor,
      required this.borderColor
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(10.w, 8.h, 14.w, 8.h),
        decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.all(Radius.circular(100.r)),
            border: Border.all(width: 1.w, color: borderColor)),
        child: Row(
          children: [
            Image.asset(countryFlag),
            SizedBox(
              width: 12.w,
            ),
            Text(
              countryName,
              style: AppTextStyle.textLRegular(AppColors.neutral900),
                overflow: TextOverflow.ellipsis,

            )
          ],
        ),
      ),
    );
  }
}
