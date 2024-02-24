import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/my_appbar.dart';
// import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

class TermsConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var svgUrl = AppAssets.svgUrl;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyAppBar(title: 'Terms & Conditions'),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Lorem ipsum dolor',
                style: AppTextStyle.headingFourMedium(AppColors.neutral900),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at.',
                style: AppTextStyle.textMRegular(AppColors.neutral500),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Text(
                  'Lorem ipsum dolor',
                  style: AppTextStyle.headingFourMedium(AppColors.neutral900),
                ),
              ),
              Text(
                'Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                style: AppTextStyle.textMRegular(AppColors.neutral500),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.h, bottom: 8.h),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12.h , horizontal: 14.w),
                  decoration: const BoxDecoration(
                    color: AppColors.neutral100
                  ),
                  child: Text('Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at.',
                  style: AppTextStyle.textMRegular(AppColors.neutral500),
                ),
                ),
              ),
              Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ' , style: AppTextStyle.textMRegular(AppColors.neutral500),)
            ],
          ),
        ),
      )),
    );
  }
}
