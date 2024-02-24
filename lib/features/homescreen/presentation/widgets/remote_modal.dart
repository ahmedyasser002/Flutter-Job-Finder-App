import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/app_btn.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/homescreen/presentation/widgets/filter_jobtype_container_modal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RemoteModal extends StatelessWidget {
  const RemoteModal({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double containerHeight = 0.32 * screenHeight; // 20% of screen height
    return Stack(
      alignment: Alignment.bottomCenter,
      children:[ Container(
        padding: EdgeInsets.fromLTRB(24.w, 32.h, 24.w, 40.h),
        width: 375.w,
        // constraints: BoxConstraints(minHeight: 249.h),
        // height: 249.h,
        height: containerHeight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r))),
        child: Column(
          children: [
            Center(
              child: Text(
                'On-Site/Remote',
                style:
                    AppTextStyle.headingFiveMedium(const Color.fromRGBO(34, 39, 65, 1)),
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterJobTypeContainer(jobType: 'Remote'),
                FilterJobTypeContainer(jobType: 'Onsite'),
                FilterJobTypeContainer(jobType: 'Hybrid'),
                FilterJobTypeContainer(jobType: 'Any'),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            
          ],
        ),
      ),
      Positioned(
        bottom: 25,
        child: AppBtn(
                btnText: 'Show Result',
                btnColor: AppColors.primary500,
                textColor: const Color(0xFFFFFFFF),
                onTap: () {
                  Navigator.pop(context);
                }))
    ]);
  }
}
