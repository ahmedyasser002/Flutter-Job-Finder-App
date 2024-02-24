import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class NotiContainer extends StatelessWidget {
  var imgUrl = AppAssets.imageUrl;
  var svgUrl = AppAssets.svgUrl;
  String notificImg;
  String notificName;
  String notifiContent;
  String notificTime;
  bool? isYesterday;
  bool? isActive;

  NotiContainer(
      {super.key,
      required this.notificImg,
      required this.notifiContent,
      required this.notificName,
      required this.notificTime,
      this.isYesterday,
      this.isActive
      });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 13.h),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1.w, color: AppColors.neutral200))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.primary100,
            child: ClipOval(
              child: Image(
                image: AssetImage('$imgUrl$notificImg'),
                width: isYesterday != null
                    ? 24
                    : 40, // Set the desired width of the image
                height: isYesterday != null
                    ? 24
                    : 40, // Set the desired height of the image
              ),
            ),
          ),
          SizedBox(width: 11.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notificName,
                style: AppTextStyle.textMMedium(AppColors.neutral900),
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 200.w),
                child: Text(
                  notifiContent,
                  style: AppTextStyle.textSRegular(AppColors.neutral500),
                ),
              )
            ],
          ),
          const Spacer(),
          Row(
            children: [
              isActive !=null ? const SizedBox() : SvgPicture.asset('${svgUrl}yellowDot.svg'),
              SizedBox(
                width: 8.w,
              ),
              Text(
                notificTime,
                style: AppTextStyle.textSRegular(AppColors.neutral500),
              )
            ],
          )
        ],
      ),
    );
  }
}
