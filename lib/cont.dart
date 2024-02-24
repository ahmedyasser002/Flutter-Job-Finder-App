import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/job_type_container.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class Cont extends StatelessWidget {
  String imgUrl = AppAssets.imageUrl;
  String svgUrl = AppAssets.svgUrl;

  Cont({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // constraints: BoxConstraints(maxWidth: 300.w),
        height: 150.h,
          padding: EdgeInsets.fromLTRB(16.w, 18.h, 16.w, 18.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
              color: AppColors.primary900),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    '${imgUrl}zoom-logo.png',
                    width: 28.w,
                    height: 28.h,
                  ),
                  SizedBox(width: 15.w),
                  const Column(
                    children: [
                      Text('Product Designer'),
                      Text('Zoom . United States')
                    ],
                  ),
                  const Spacer(),
                  SvgPicture.asset('${svgUrl}bookmark.svg')
                ],
              ),
              SizedBox(height: 16.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  JobTypeContainer(jobType: 'jobType', color: AppColors.primary100, horizontalPadding: 16),
                  JobTypeContainer(jobType: 'jobType', color: AppColors.primary100, horizontalPadding: 16),
                  JobTypeContainer(jobType: 'jobType', color: AppColors.primary100, horizontalPadding: 16),

                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('data'),
                  Text('50k/month')
                ],
              )
            ],
          )),
    );
  }
}
