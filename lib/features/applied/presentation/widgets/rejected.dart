import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Rejected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var imgUrl = AppAssets.imageUrl;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('${imgUrl}rejected.png'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Center(
              child: Text('No applications were rejected' , style: AppTextStyle.headingThreeMedium(AppColors.neutral900),),
            ),
          ),
          Center(
            
            child: Text('If there is an application that is rejected by the company it will appear here' , style: AppTextStyle.textLRegular(AppColors.neutral500), textAlign: TextAlign.center,),
          )
          
          ],
      ),
    );
  }
}
