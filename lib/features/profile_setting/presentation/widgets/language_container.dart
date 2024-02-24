import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class LanguageContainer extends StatelessWidget {
  String languageIcon;
  String languageText;
  String svgUrl = AppAssets.svgUrl;
  String imgUrl = AppAssets.imageUrl;
   final ValueChanged<String> onContainerSelected;
  String value;
  final String groupValue;
  LanguageContainer(
      {super.key, required this.languageIcon, required this.languageText , required this.value , required this.groupValue , required this.onContainerSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 6.h),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1.w, color: AppColors.neutral200))),
        child: Row(
          children: [
            Image.asset(
              '$imgUrl$languageIcon',
              width: 30,
              height: 20,
            ),
            SizedBox(
              width: 14.w,
            ),
            Text(
              languageText,
              style: AppTextStyle.textLMedium(AppColors.neutral900),
            ),
            const Spacer(),
             Radio(
              value: value,
              groupValue: groupValue,
              onChanged: (value) {
                onContainerSelected(value.toString());
                // setState(() {
                //   isSelected = !isSelected;
                // });
              },
            ),
          ],
        ),
      ),
    );
  }
}
