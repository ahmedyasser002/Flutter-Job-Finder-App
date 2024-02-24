import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/apply_job/presentation/widgets/person_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class People extends StatelessWidget {
  
  var svgUrl = AppAssets.svgUrl;
  String jobName;

  People({super.key , required this.jobName});
  @override
  Widget build(BuildContext context) {
    List<PersonContainer> employees = [
    PersonContainer(
        userImg: 'Dimas.png',
        noYears: '5',
        username: 'Dimas Yasser',
        jobPosition: 'Senior UI/UX Designer',
        jobName: jobName,
        ),
    PersonContainer(
        userImg: 'Dimas.png',
        noYears: '4',
        username: 'Syahrul Ramadhani',
        jobPosition: 'Senior UI/UX Designer',
        jobName: jobName,
        ),
        PersonContainer(
        userImg: 'Dimas.png',
        noYears: '5',
        username: 'Dimas Yasser',
        jobPosition: 'Senior UI/UX Designer',
        jobName: jobName,
        ),
        PersonContainer(
        userImg: 'Dimas.png',
        noYears: '5',
        username: 'Dimas Yasser',
        jobPosition: 'Senior UI/UX Designer',
        jobName: jobName,
        ),
        PersonContainer(
        userImg: 'Dimas.png',
        noYears: '5',
        username: 'Dimas Yasser',
        jobPosition: 'Senior UI/UX Designer',
        jobName: jobName,
        ),
        PersonContainer(
        userImg: 'Dimas.png',
        noYears: '5',
        username: 'Dimas Yasser',
        jobPosition: 'Senior UI/UX Designer',
        jobName: jobName,
        ),
        PersonContainer(
        userImg: 'Dimas.png',
        noYears: '5',
        username: 'Dimas Yasser',
        jobPosition: 'Senior UI/UX Designer',
        jobName: jobName,
        ),
        PersonContainer(
        userImg: 'Dimas.png',
        noYears: '5',
        username: 'Dimas Yasser',
        jobPosition: 'Senior UI/UX Designer',
        jobName: jobName,
        ),
        PersonContainer(
        userImg: 'Dimas.png',
        noYears: '5',
        username: 'Dimas Yasser',
        jobPosition: 'Senior UI/UX Designer',
        jobName: jobName,
        ),
  ];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '6 Employees For',
                  style: AppTextStyle.textMMedium(AppColors.neutral900),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  jobName,
                  style: AppTextStyle.textSRegular(AppColors.neutral500),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100.r)),
                  border: Border.all(width: 1.w, color: AppColors.neutral300)),
              child: Row(
                children: [
                  Text(
                    jobName,
                    style: AppTextStyle.textSRegular(AppColors.neutral900),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  SvgPicture.asset('${svgUrl}black-arrow-down.svg')
                ],
              ),
            )
          ],
        ),
        SizedBox(
            height: 16.h), // Add some spacing between the text and the list

        // Use ListView.separated to display the list with separators
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            itemCount: employees.length,
            separatorBuilder: (context, index) =>
                const Divider(), // Add your separator here
            itemBuilder: (context, index) => employees[index],
          ),
        ),
      ],
    );
  }
}
