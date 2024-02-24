import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Company extends StatelessWidget {
  String compEmail;
  String compWebsite;
  String aboutComp;
  Company({super.key , required this.compEmail , required this.compWebsite , required this.aboutComp});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Us',
            style: AppTextStyle.textMMedium(AppColors.neutral900),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.h, bottom: 24.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                  width: 157,
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 1.w, color: AppColors.neutral200)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: AppTextStyle.textSRegular(AppColors.neutral400),
                      ),
                      Text(
                        compEmail,
                        style: AppTextStyle.textMMedium(AppColors.neutral900),
                      )
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                  width: 157,
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 1.w, color: AppColors.neutral200)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Website',
                        style: AppTextStyle.textSRegular(AppColors.neutral400),
                      ),
                      Text(
                        compWebsite,
                        style: AppTextStyle.textMMedium(AppColors.neutral900),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text(
            'About Company',
            style: AppTextStyle.textMMedium(AppColors.neutral900),
          ),
          SizedBox(
            height: 18.h,
          ),
          Text(
            aboutComp,
            style: AppTextStyle.textSRegular(AppColors.neutral600),
          )
        ],
      ),
    );
  }
}
