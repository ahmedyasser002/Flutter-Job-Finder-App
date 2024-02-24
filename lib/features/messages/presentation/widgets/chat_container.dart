import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ChatContainer extends StatelessWidget {
  bool isSender;
  String chatText;
  ChatContainer({super.key, required this.isSender, required this.chatText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      constraints: BoxConstraints(
        maxWidth: 272.w
      ),
      // width: 272.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(isSender ? 0 : 8.r),
              topLeft: Radius.circular(isSender ? 8.r : 0),
              bottomLeft: Radius.circular(8.r),
              bottomRight: Radius.circular(8.r)),
          color: isSender ? AppColors.primary500 : AppColors.neutral200),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 25.h),
            child: Text(
              chatText,
              style: AppTextStyle.textMRegular(
                  isSender ? AppColors.neutral100 : AppColors.neutral800),
              textAlign: TextAlign.start,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Text('10:18' , style: AppTextStyle.textSRegular(isSender ? AppColors.neutral200 : AppColors.neutral500),),
          )
        ],
      ),
    );
  }
}
