import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class BasicTextField extends StatelessWidget {
  bool? isDate;
  Function()? onTap;
  TextEditingController? controller = TextEditingController();
  BasicTextField({super.key, this.isDate, this.onTap , this.controller});

  @override
  Widget build(BuildContext context) {
    var svgUrl = AppAssets.svgUrl;
    return SizedBox(
      width: double.infinity,
      height: 55.h,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            suffixIcon: isDate != null
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                        onTap: onTap,
                        child: SvgPicture.asset('${svgUrl}calendar.svg')),
                  )
                : null,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              borderSide: BorderSide(color: AppColors.neutral300, width: 1.w),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              borderSide: BorderSide(color: AppColors.neutral300, width: 1.w),
            )),
      ),
    );
  }
}
