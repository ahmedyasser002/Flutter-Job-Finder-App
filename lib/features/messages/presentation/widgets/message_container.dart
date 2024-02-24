import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class MessageContainer extends StatelessWidget {
  var imgUrl = AppAssets.imageUrl;
  String imgName;
  String msg;
  String name;
  String msgTime;
  bool isRead;
  MessageContainer(
      {super.key,
      required this.imgName,
      required this.msg,
      required this.msgTime,
      required this.name,
      required this.isRead});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [CircleAvatar(
            radius: 22.r,
            backgroundImage: AssetImage('$imgUrl$imgName'),
          ),
           if (isRead==false) Positioned(child: Image.asset('${imgUrl}Message.png'))

      ]),
        // Stack(children: [
        //   Container(
        //     width: 44,
        //     height: 44,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.all(Radius.circular(100.r)),
        //     ),
        //     child: Image.asset('$imgUrl$imgName'),
        //   ),
        //   if (!isRead) Positioned(child: Image.asset('${imgUrl}Message.png'))
        // ]),
        SizedBox(width: 16.w),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                  bottom:
                      BorderSide(width: 1.w, color: AppColors.neutral200)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTextStyle.textLMedium(AppColors.neutral900),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      msg,
                      style: AppTextStyle.textSRegular(AppColors.neutral500),
                    ),
                    SizedBox(height: 12.h),
                  ],
                ),
                Text(
                  msgTime,
                  style: AppTextStyle.textSRegular(AppColors.primary500),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(
          //       '$name',
          //       style: AppTextStyle.textLMedium(AppColors.neutral900),
          //     ),
          //     SizedBox(height: 4.h),
          //     Text(
          //       msg,
          //       style: AppTextStyle.textSRegular(AppColors.neutral500),
          //     ),
          //     SizedBox(height: 12.h),
            
          //   ],
          // ),
          // Spacer(),
          // Text(
          //   msgTime,
          //   style: AppTextStyle.textSRegular(AppColors.primary500),
          // )