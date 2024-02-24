import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/saved_notifications/data/data_models/saved_job_model.dart';
import 'package:flutter_application_1/features/saved_notifications/presentation/widgets/saved_modal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class SavedContainer extends StatelessWidget {
  var imgUrl = AppAssets.imageUrl;
  var svgUrl = AppAssets.svgUrl;
  SavedJobModel savedModel;

  SavedContainer({super.key, required this.savedModel});
  // DateTime creationDay = DateTime.parse(savedModel.createDate!);
  // String savedImg;
  // String savedName;
  // String savedContent;
  // String savedTime;
  // bool? isYesterday;
  // bool? isActive;

  // SavedContainer(
  //     {super.key,
  //     required this.savedImg,
  //     required this.savedContent,
  //     required this.savedName,
  //     required this.savedTime,
  //     this.isYesterday,
  //     this.isActive
  //     });
  @override
  Widget build(BuildContext context) {
    DateTime creationDay = DateTime.parse(savedModel.createDate!);
    DateTime today = DateTime.now();
    var dayDiff = today.difference(creationDay).inDays;
    int monthsDifference =
        today.month - creationDay.month + (today.year - creationDay.year) * 12;

    return Container(
      padding: EdgeInsets.only(bottom: 13.h),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1.w, color: AppColors.neutral200))),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                    // color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(8.r))),
                child: Image.network(
                  '${savedModel.savedImg}',
                  fit: BoxFit.contain,
                ),
                // child: Image.asset(
                //   '$imgUrl$savedImg',
                //   fit: BoxFit.contain,
                // ),
              ),
              SizedBox(width: 11.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${savedModel.jobName}',
                    style: AppTextStyle.textMMedium(AppColors.neutral900),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Container(
                    constraints: BoxConstraints(maxWidth: 200.w),
                    child: Text(
                      '${savedModel.compName} •  ${savedModel.location!.split(',').last.trim()}',
                      style: AppTextStyle.textSRegular(AppColors.neutral500),
                    ),
                  )
                ],
              ),
              const Spacer(),
              InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.r),
                            topRight: Radius.circular(16.r),
                          ),
                        ),
                        builder: (context) {
                          return SavedModal(onUnreadPress: () {});
                        });
                  },
                  child: SvgPicture.asset('${svgUrl}more.svg'))
              // Row(
              //   children: [
              //     // isActive != null
              //     //     ? const SizedBox()
              //     SvgPicture.asset('${svgUrl}yellowDot.svg'),
              //     SizedBox(
              //       width: 8.w,
              //     ),
              //     Text(
              //       '10:00',
              //       style: AppTextStyle.textSRegular(AppColors.neutral500),
              //     )
              //   ],
              // )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 14.h),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dayDiff > 30
                        ? 'Posted $monthsDifference months ago'
                        : 'Posted $dayDiff days ago',
                    style: AppTextStyle.textSRegular(AppColors.neutral700),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('${svgUrl}gclock.svg'),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'Be an early applicant',
                        style: AppTextStyle.textSRegular(AppColors.neutral700),
                      )
                    ],
                  )
                ]),
          )
        ],
      ),
    );
  }
}
