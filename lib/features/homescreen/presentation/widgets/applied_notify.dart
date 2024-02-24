import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
// import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
// import 'package:flutter_application_1/features/homescreen/data/data_models/suggested_job_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AppliedNotify extends StatefulWidget {
  AppliedNotify({super.key});

  @override
  State<AppliedNotify> createState() => _AppliedNotifyState();
}

class _AppliedNotifyState extends State<AppliedNotify> {
  Color btnClr = AppColors.primary200;
  String btnText = 'Submitted';
  bool invisible = false;
  @override
  Widget build(BuildContext context) {
    var imgUrl = AppAssets.imageUrl;
    if (invisible == true) {
      return SizedBox(); // Return an empty SizedBox if btnText is 'Accepted'
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: AppColors.primary100,
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
        child: Row(
          children: [
            Image.asset('${imgUrl}Twitter.png'),

            SizedBox(
              width: 14.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text('Twitter' , style: AppTextStyle.textLMedium(AppColors.neutral900),), 
              Text('Waiting to be selected by the\ntwitter team' , style: AppTextStyle.textSRegular(AppColors.neutral700),)],
            ),
            Spacer(),
            InkWell(
              onTap: () {
                setState(() {
                  if (btnText == 'Accepted') {
                    invisible = true;
                  }
                  btnText = 'Accepted';
                  btnClr = AppColors.success300;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100.r)),
                    color: btnClr),
                child: Text(btnText),
              ),
            )
          ],
        ),
      ),
    );
  }
}
