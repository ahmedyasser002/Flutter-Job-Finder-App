import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class CVContainer extends StatelessWidget {
  final String? fileName;
  int? fileSize;
  void Function()? onTap;
  void Function()? onCancel;

  CVContainer({super.key, required this.fileName, required this.onTap , required this.fileSize , required this.onCancel});

  @override
  Widget build(BuildContext context) {
    var svgUrl = AppAssets.svgUrl;
    if (fileName != null) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.all(width: 1.w, color: AppColors.neutral300),
            borderRadius: BorderRadius.all(Radius.circular(8.r))),
        child: Row(
          children: [
            SvgPicture.asset('${svgUrl}pdfLogo.svg'),
            SizedBox(
              width: 8.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fileName!,
                  style: AppTextStyle.textMMedium(AppColors.neutral900),
                ),
                Text(
                  'CV.pdf $fileSize',
                  style: AppTextStyle.textSRegular(AppColors.neutral500),
                )
              ],
            ),
            const Spacer(),
            SvgPicture.asset('${svgUrl}edit.svg'),
            SizedBox(
              width: 8.w,
            ),
            InkWell(
              onTap: onCancel ,
              child: SvgPicture.asset('${svgUrl}cancel.svg')),
          ],
        ),
      );
    } else {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(width: 1.w, color: AppColors.neutral300),
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
          ),
          child: Row(
            children: [
              SvgPicture.asset('${svgUrl}upload.svg'),
              SizedBox(width: 8.h),
              Text(
                'Upload CV',
                style: TextStyle(
                  color: AppColors.neutral500,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
