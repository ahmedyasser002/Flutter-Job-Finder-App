import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class MessageFilterModal extends StatelessWidget {
  var svgUrl = AppAssets.svgUrl;
  void Function()? onUnreadPress;

  MessageFilterModal({super.key , required this.onUnreadPress});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double containerHeight = 0.41 * screenHeight; // 20% of screen height
    return SizedBox(
      height: containerHeight,
      child: Padding(
        padding: EdgeInsets.only(top: 36.h, right: 24.w, left: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Message Filters',
              style: AppTextStyle.headingFiveMedium(AppColors.neutral900),
            ),
            SizedBox(
              height: 16.h,
            ),
            InkWell(
              onTap: onUnreadPress,
              child: Container(
                padding: const EdgeInsets.all(14),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100.r)),
                    border:
                        Border.all(width: 1.w, color: AppColors.neutral300)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Unread',
                      style: AppTextStyle.textLMedium(AppColors.neutral700),
                    ),
                    SvgPicture.asset('${svgUrl}arrow-right.svg')
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Container(
                padding: const EdgeInsets.all(14),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100.r)),
                    border:
                        Border.all(width: 1.w, color: AppColors.neutral300)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Spam',
                      style: AppTextStyle.textLMedium(AppColors.neutral700),
                    ),
                    SvgPicture.asset('${svgUrl}arrow-right.svg')
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(14),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100.r)),
                  border: Border.all(width: 1.w, color: AppColors.neutral300)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Archived',
                    style: AppTextStyle.textLMedium(AppColors.neutral700),
                  ),
                  SvgPicture.asset('${svgUrl}arrow-right.svg')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
