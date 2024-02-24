import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class ChatModal extends StatelessWidget {
  var svgUrl = AppAssets.svgUrl;

  ChatModal({super.key});
  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
    // double containerHeight = 0.60 * screenHeight; // 20% of screen height
    return SizedBox(
      // height: containerHeight,
      child: Padding(
        padding: EdgeInsets.only(top: 36.h, right: 24.w, left: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100.r)),
                  border:
                      Border.all(width: 1.w, color: AppColors.neutral300)),
              child: Row(
                children: [
                  SvgPicture.asset('${svgUrl}briefcase_black.svg'),
                  SizedBox(width: 12.w,),
                  Text(
                    'Visit job post',
                    style: AppTextStyle.textLMedium(AppColors.neutral700),
                  ),
                ],
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
                children: [
                  SvgPicture.asset('${svgUrl}note.svg'),
                  SizedBox(width: 12.w,),
                  Text(
                    'View my application',
                    style: AppTextStyle.textLMedium(AppColors.neutral700),
                  ),
                ],
              ),
            ),
            ),
            Container(
              padding: const EdgeInsets.all(14),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100.r)),
                  border:
                      Border.all(width: 1.w, color: AppColors.neutral300)),
              child: Row(
                children: [
                  SvgPicture.asset('${svgUrl}sms_black.svg'),
                  SizedBox(width: 12.w,),
                  Text(
                    'Mark as unread',
                    style: AppTextStyle.textLMedium(AppColors.neutral700),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical:12.h ),
              child: Container(
                padding: const EdgeInsets.all(14),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100.r)),
                    border:
                        Border.all(width: 1.w, color: AppColors.neutral300)),
                child: Row(
                  children: [
                    SvgPicture.asset('${svgUrl}notification.svg'),
                    SizedBox(width: 12.w,),
                    Text(
                      'Mute',
                      style: AppTextStyle.textLMedium(AppColors.neutral700),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(14),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100.r)),
                  border:
                      Border.all(width: 1.w, color: AppColors.neutral300)),
              child: Row(
                children: [
                  SvgPicture.asset('${svgUrl}import.svg'),
                  SizedBox(width: 12.w,),
                  Text(
                    'Archive',
                    style: AppTextStyle.textLMedium(AppColors.neutral700),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: Container(
                padding: const EdgeInsets.all(14),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100.r)),
                    border:
                        Border.all(width: 1.w, color: AppColors.neutral300)),
                child: Row(
                  children: [
                    SvgPicture.asset('${svgUrl}trash.svg'),
                    SizedBox(width: 12.w,),
                    Text(
                      'Delete conversation',
                      style: AppTextStyle.textLMedium(AppColors.neutral700),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
