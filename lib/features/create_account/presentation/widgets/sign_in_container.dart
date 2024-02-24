import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class SignInContainer extends StatelessWidget {
  String svgUrl;
  String accType;
  SignInContainer({super.key, required this.svgUrl , required this.accType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24.w, 13.h, 24.w, 13.h),
      // height: 46.h,
      width: 154.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          border: Border.all(width: 1.r, color: AppColors.neutral300)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(svgUrl),
          SizedBox(
            width: 10.w,
          ),
          Text(
            accType,
            style: AppTextStyle.textMMedium(const Color(0xFF363F5E)),
          )
        ],
      ),
    );
  }
}
