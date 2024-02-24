import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class LoginSecurityContainer extends StatelessWidget {
  String option;
  String svgUrl = AppAssets.svgUrl;
  String? value;
  Widget widget;
  LoginSecurityContainer(
      {super.key, required this.option, this.value, required this.widget});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget));
      },
      child: Padding(
        padding: EdgeInsets.only(right: 24.w, left: 24.w, top: 6.h),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 18.h),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1.w, color: AppColors.neutral200))),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                option,
                style: AppTextStyle.textLRegular(AppColors.neutral900),
              ),
              const Spacer(),
              value == null
                  ? const SizedBox()
                  : Text(
                      value!,
                      style: AppTextStyle.textMRegular(AppColors.neutral500),
                    ),
              SizedBox(
                width: 8.w,
              ),
              SvgPicture.asset('${svgUrl}arrow-right.svg')
            ],
          ),
        ),
      ),
    );
  }
}
