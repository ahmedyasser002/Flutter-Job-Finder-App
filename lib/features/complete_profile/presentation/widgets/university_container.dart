import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class UniversityContainer extends StatelessWidget {
  String universityName;
  String degree;
  String startDate;
  String endDate;
  bool? isExpr;

  UniversityContainer(
      {super.key,
      required this.degree,
      required this.endDate,
      required this.startDate,
      required this.universityName,
      this.isExpr
      });

  @override
  Widget build(BuildContext context) {
    var imgUrl = AppAssets.imageUrl;
    var svgUrl = AppAssets.svgUrl;

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
          decoration: BoxDecoration(
              border: Border.all(width: 1.w, color: AppColors.neutral300),
              borderRadius: BorderRadius.all(Radius.circular(8.r))),
          child: Row(
            children: [
              Container(
                width: 44.w,
                height: 44.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(width: 1.w, color: AppColors.neutral300)),
                child: Image.asset('${imgUrl}university.png'),
              ),
              SizedBox(
                width: 24.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    universityName,
                    style: AppTextStyle.textLMedium(AppColors.neutral900),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Text(
                      degree,
                      style: AppTextStyle.textMMedium(AppColors.neutral500),
                    ),
                  ),
                  Text(
                    '${startDate} - ${endDate}',
                    style: AppTextStyle.textMRegular(AppColors.neutral400),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
        Positioned(
            bottom: 12.h,
            right: 12.w,
            child: SvgPicture.asset('${svgUrl}edit.svg'))
      ],
    );
  }
}
