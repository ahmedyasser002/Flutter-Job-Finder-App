import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AppBtn extends StatelessWidget {
  String btnText;
  Color btnColor;
  Color textColor;

  void Function()? onTap;
  AppBtn({super.key, required this.btnText,required this.btnColor, required this.textColor ,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 327.w,
        // height: 48.h,
        padding: const EdgeInsets.fromLTRB(14, 15, 14, 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(1000.r)),
            color: btnColor),
        child: Center(
          child: Text(
            btnText,
            style: AppTextStyle.textLMedium(textColor),
          ),
        ),
      ),
    );
  }
}
