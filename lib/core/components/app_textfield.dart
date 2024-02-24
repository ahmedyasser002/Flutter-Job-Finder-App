import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class AppTextField extends StatelessWidget {
  String hintText;
  String? prefixIcon;
  var controller = TextEditingController();
  AppTextField({super.key, required this.hintText, required this.prefixIcon , required this.controller});

  @override
  Widget build(BuildContext context) {
    var svgUrl = AppAssets.svgUrl;
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: prefixIcon!=null? Padding(
            padding: const EdgeInsets.only(left: 16, right: 12),
            child: SvgPicture.asset('$svgUrl$prefixIcon')
            ) : null,
        hintText: hintText,
        hintStyle: AppTextStyle.textMRegular(AppColors.neutral400),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.neutral300, width: 1.w),
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.w),
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
        ),
      ),
    );
  }
}
