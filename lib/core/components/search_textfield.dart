import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class SearchTextfield extends StatelessWidget {
  String svgName;
  String? suffixIconName;
  var myController = TextEditingController();
  String hintText;
  final void Function(String)? onSubmittedCallback;
  void Function()? onTap;
   FocusNode? focusNode;

  SearchTextfield(
      {super.key,
      required this.svgName,
      required this.onSubmittedCallback,
      this.suffixIconName,
      this.onTap,
      this.focusNode,
      required this.hintText,
      required this.myController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      focusNode: focusNode,
      onSubmitted: (value) {
        if (onSubmittedCallback != null) {
          onSubmittedCallback!(value);
        }
      },
      decoration: InputDecoration(
        prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 16, right: 12),
            child: SvgPicture.asset(svgName)),
        hintText: hintText,
        hintStyle: AppTextStyle.textMRegular(AppColors.neutral400),
        suffixIcon: suffixIconName == null
            ? null
            : InkWell(
                onTap: onTap,
                child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 12),
                    child: SvgPicture.asset(suffixIconName!))),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.neutral300, width: 1.w),
          borderRadius: BorderRadius.all(Radius.circular(100.r)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.neutral300, width: 1.w),
          borderRadius: BorderRadius.all(Radius.circular(100.r)),
        ),
      ),
    );
  }
}
