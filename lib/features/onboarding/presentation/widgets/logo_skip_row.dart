import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/create_account/presentation/screens/create_account.dart';
import 'package:flutter_application_1/features/onboarding/data/onboarding_sharedpref.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class LogoSkipRow extends StatelessWidget {
  var imageUrl = AppAssets.imageUrl;

  LogoSkipRow({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 60.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            '${imageUrl}splash_logo.png',
            width: 81.w,
            height: 19.h,
          ),
          InkWell(
              onTap: () {
                OnBoardingSharedPref.setBool(true);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateAccount()));
              },
              child: Text(
                'Skip',
                style: AppTextStyle.textLRegular(AppColors.neutral500),
              ))
        ],
      ),
    );
  }
}
