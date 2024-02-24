import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/onboarding/presentation/widgets/logo_skip_row.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class BoardingWidgets extends StatelessWidget {
  var imageUrl = AppAssets.imageUrl;
  RichText boardingHeaders;
  String descriptionText;
  String imageName;

  BoardingWidgets({
    super.key,
    required this.boardingHeaders,
    required this.descriptionText,
    required this.imageName
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: 424.h,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Image.asset("$imageUrl$imageName"),
              LogoSkipRow()
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: boardingHeaders),
        Padding(
          padding:
              EdgeInsets.only(left: 24.w, right: 24.w, top: 12.h, bottom: 37.h),
          child: Text(
            descriptionText,
            style: AppTextStyle.textLRegular(AppColors.neutral500),
          ),
        ),
      ]),
    );
  }
}
