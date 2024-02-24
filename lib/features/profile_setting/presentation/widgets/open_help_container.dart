import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OpenHelpContainer extends StatelessWidget {
  const OpenHelpContainer({super.key});

  @override
  Widget build(BuildContext context) {
    var svgUrl = AppAssets.svgUrl;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          border: Border.all(width: 1.w, color: AppColors.neutral300)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Lorem ipsum dolor sit amet',
                style: AppTextStyle.textLMedium(AppColors.neutral900),
              ),
              SvgPicture.asset('${svgUrl}arrow-up.svg')
            ],
          ),
          SizedBox(height: 16.h,),
          Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.' , style: AppTextStyle.textMRegular(AppColors.neutral500),)
        ],
      ),
    );
  }
}
