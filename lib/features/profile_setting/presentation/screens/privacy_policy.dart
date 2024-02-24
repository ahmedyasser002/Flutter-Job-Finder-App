import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/my_appbar.dart';
// import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

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
             MyAppBar(title: 'Privacy policy'),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Your privacy is important',
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
                padding: EdgeInsets.only(top: 12.h , bottom: 16.h),
                child: Text(
                  'Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at.',
                style: AppTextStyle.textMRegular(AppColors.neutral500),
              ),
              ),
              Text('Data controllers and contract partners' , style: AppTextStyle.headingFourMedium(AppColors.neutral900),)
              ,
              SizedBox(height: 12.h,),
              Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ' 
              , 
              style: AppTextStyle.textMRegular(AppColors.neutral500),)
            
            ],
          ),
        ),
      )),
    );
  }
}
