import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class FilterJobTypeContainer extends StatefulWidget {
  String jobType;
  FilterJobTypeContainer({super.key , required this.jobType});

  @override
  State<FilterJobTypeContainer> createState() => _FilterJobTypeContainerState();
}

class _FilterJobTypeContainerState extends State<FilterJobTypeContainer> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        decoration: BoxDecoration(
            color: isPressed ? AppColors.primary100 : const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.all(Radius.circular(100.r)),
            border: Border.all(
                width: 1.w,
                color:
                    isPressed ? AppColors.primary500 : AppColors.neutral400)),
        child: Text(
          widget.jobType,
          style: AppTextStyle.textSRegular(
              isPressed ? AppColors.primary500 : AppColors.neutral500),
        ),
      ),
    );
  }
}
