import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class AccTextField extends StatelessWidget {
  Color focusColor;
  final SvgPicture focusedPrefixIcon;
  final SvgPicture unfocusedPrefixIcon;
  SvgPicture? postIcon;
  String hintText;
  void Function(String value)? onChanged;

  AccTextField(
      {super.key,
      required this.focusColor,
      required this.focusedPrefixIcon,
      required this.unfocusedPrefixIcon,
      required this.hintText,
      required this.onChanged,
      this.postIcon});

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();

    return SizedBox(
      width: 327.w,
      height: 56.h,
      child: Focus(
        child: TextField(
          focusNode: focusNode,
          onChanged: onChanged,
          decoration: InputDecoration(
            // prefixIconConstraints: BoxConstraints(maxHeight: 36.h , maxWidth: 36.w),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 16, right: 12),
              child: focusNode.hasFocus == true
                  ? focusedPrefixIcon
                  : unfocusedPrefixIcon,
            ),
            suffixIcon: postIcon,
            hintText: hintText,
            hintStyle: AppTextStyle.textMRegular(AppColors.neutral400),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.neutral300, width: 1.w),
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: focusColor, width: 1.w),
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
            ),
          ),
        ),
      ),
    );
  }
}
