import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class PersonContainer extends StatelessWidget {
  var imgUrl = AppAssets.imageUrl;
  String userImg;
  String username;
  String noYears;
  String jobPosition;
  String jobName;
  // String jobName;

  PersonContainer(
      {super.key,
      required this.userImg,
      required this.noYears,
      required this.username,
      required this.jobPosition,
      required this.jobName
      });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1.w, color: AppColors.neutral300))),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('$imgUrl$userImg'),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: AppTextStyle.textMMedium(AppColors.neutral900),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'UI/UX DESIGNER at Twitter',
                  style: AppTextStyle.textSRegular(AppColors.neutral500),
                )
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Work during',
                  style: AppTextStyle.textSRegular(AppColors.neutral500),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  '$noYears Years',
                  style: AppTextStyle.textSMedium(AppColors.primary500),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
