import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class CompleteContainer extends StatelessWidget {
  Color containerColor;
  String containerText;
  String containerDesc;
  bool? isLast;
  CompleteContainer(
      {super.key,
      required this.containerColor,
      required this.containerText,
      required this.containerDesc,
      this.isLast});

  @override
  Widget build(BuildContext context) {
    var svgUrl = AppAssets.svgUrl;
    return Column(
      children: [
        Container(
          // height: 85.h,
          constraints: BoxConstraints(minHeight: 85.h),
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 14.w),
          width: double.infinity,
          decoration: BoxDecoration(
              color: containerColor == AppColors.primary300
                  ? Color.fromRGBO(224, 235, 255, 1)
                  : Colors.white,
              border: Border.all(
                  width: 1.w,
                  color: containerColor == AppColors.primary300
                      ? containerColor
                      : AppColors.neutral300),
              borderRadius: BorderRadius.all(Radius.circular(8.r))),
          child: Row(
            children: [
              containerColor == AppColors.primary300
                  ? SvgPicture.asset('${svgUrl}blueTick.svg')
                  : SvgPicture.asset('${svgUrl}tick-circle.svg'),
              SizedBox(
                width: 16.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    containerText,
                    style: AppTextStyle.textLMedium(AppColors.neutral900),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    containerDesc,
                    style: AppTextStyle.textSRegular(AppColors.neutral500),
                  )
                ],
              ),
              Spacer(),
              SvgPicture.asset('${svgUrl}arrow-right.svg')
            ],
          ),
        ),
        isLast!=null? SizedBox():
        Container(
          width: 1.w,
          height: 20.h,
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1.w,
                  color: containerColor == AppColors.primary300
                      ? containerColor
                      : AppColors.neutral300)),
        )
      ],
    );
  }
}
