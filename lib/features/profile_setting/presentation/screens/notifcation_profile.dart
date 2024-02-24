import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/my_appbar.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/profile_setting/presentation/widgets/notify_setting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class NotificationProfile extends StatelessWidget {
  var svgUrl = AppAssets.svgUrl;
  List<String> notifyText = [
    'Your Job Search Alert',
    'Job Application Update',
    'Job Application Reminders',
    'Jobs You May Be Interested In',
    'Job Seeker Updates',
  ];
  List<String> otherNotify = ['Show Profile' , 'All Message' , 'Message Nudges'];
  NotificationProfile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 28.h),
              child: MyAppBar(title: 'Notification')
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.neutral200,
                  border: Border.all(width: 1.w, color: AppColors.neutral100)),
              child: Text(
                'Job notification',
                style: AppTextStyle.textMMedium(AppColors.neutral500),
              ),
            ),
            for (int index = 0; index < notifyText.length; index++)
              NotifySetting(notifySettingText: notifyText[index]),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.neutral200,
                    border:
                        Border.all(width: 1.w, color: AppColors.neutral100)),
                child: Text(
                  'Other notification',
                  style: AppTextStyle.textMMedium(AppColors.neutral500),
                ),
              ),
            ),
            for (int index = 0; index < otherNotify.length; index++)
              NotifySetting(notifySettingText: otherNotify[index]),

          ],
        ),
      )),
    );
  }
}
