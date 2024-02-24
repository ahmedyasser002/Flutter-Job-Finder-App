import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UploadOtherFile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var svgUrl = AppAssets.svgUrl;
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: DottedBorder(
        radius: Radius.circular(8.r),
        strokeWidth: 1.5.w,
        dashPattern: const [5, 2],
        color: AppColors.primary400,
        child: Container(
          decoration: const BoxDecoration(
            // borderRadius: BorderRadius.all(Radius.circular(8.r)),
            color: Color.fromRGBO(236, 242, 255, 1),
          ),
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.h, 20.h),
          child: Column(
            children: [
              Container(
                width: 56.w,
                height: 56.h,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary100,
                  borderRadius: BorderRadius.all(Radius.circular(1000.r)),
                ),
                child: SvgPicture.asset('${svgUrl}upload.svg'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 22.h, bottom: 16.h),
                child: Text(
                  'Upload Your other file',
                  style: AppTextStyle.headingFiveMedium(AppColors.neutral900),
                ),
              ),
              Text(
                'Max. file size 10 MB',
                style: AppTextStyle.textSRegular(AppColors.neutral500),
              ),
              Padding(
                padding: EdgeInsets.only(top: 18.h, bottom: 12.h),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(1000.r)),
                      color: AppColors.primary100,
                      border:
                          Border.all(width: 1.w, color: AppColors.primary500)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('${svgUrl}export.svg'),
                    SizedBox(width: 10.w,),
                    Text('Add file' , style: AppTextStyle.textMMedium(AppColors.primary500),)
                  ],
                ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
