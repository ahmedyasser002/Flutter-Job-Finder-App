import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/job_type_container.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/apply_job/presentation/screens/job_detail.dart';
import 'package:flutter_application_1/features/homescreen/data/data_models/suggested_job_model.dart';
import 'package:flutter_application_1/features/saved_notifications/controller/saved_cubit.dart';
import 'package:flutter_application_1/features/saved_notifications/controller/saved_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class RecentJobContainer extends StatefulWidget {
  SuggestedJobModel recentJobModel;
  RecentJobContainer({super.key, required this.recentJobModel});

  @override
  State<RecentJobContainer> createState() => _RecentJobContainerState();
}

class _RecentJobContainerState extends State<RecentJobContainer> {
  var imgUrl = AppAssets.imageUrl;

  var svgUrl = AppAssets.svgUrl;

  bool isSaved = false;

  bool isSavedBefore(int id, int apiId) {
    if (id == apiId) {
      return true;
    } else {
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    var myCubit = context.read<SavedCubit>();
    return BlocBuilder<SavedCubit, SavedState>(builder: (context, state) {
      return InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => JobDetail(jobModel: widget.recentJobModel,)));
        },
        child: Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1, color: AppColors.neutral200))),
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // Image.asset('${imgUrl}zoom-logo.png'),
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                          child: Image.network(
                            '${widget.recentJobModel.imageUrl}',
                            width: 28,
                            height: 28,
                            // fit: BoxFit.cover, // You can adjust the BoxFit property as needed
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.recentJobModel.jobName}',
                              style: AppTextStyle.headingFiveMedium(
                                  AppColors.neutral900),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              '${widget.recentJobModel.compName} •  ${widget.recentJobModel.location!.split(',').last.trim()}',
                              style: AppTextStyle.textSRegular(
                                  AppColors.neutral700),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          if (myCubit.isSaved(widget.recentJobModel.jobID!) ==
                              false) {
                            // recentJobModel.jobName;
                            myCubit.addFavourite(
                                id: widget.recentJobModel.jobID!);
                          } else {
                            log('saved before');
                          }
                        });
                        // isSaved = !isSaved;
                      },
                      child: myCubit.isSaved(widget.recentJobModel.jobID!)
                          ? SvgPicture.asset('${svgUrl}filled-save.svg')
                          : SvgPicture.asset('${svgUrl}black_archive.svg'))
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    JobTypeContainer(
                      jobType: '${widget.recentJobModel.jobTimeType}',
                      color: AppColors.primary100,
                      horizontalPadding: 16,
                    ),

                    JobTypeContainer(
                      jobType: 'Remote',
                      color: AppColors.primary100,
                      horizontalPadding: 16,
                    ),

                    JobTypeContainer(
                      jobType: '${widget.recentJobModel.jobType}',
                      color: AppColors.primary100,
                      horizontalPadding: 16,
                    ),
                    // Text('\$15k' , style: AppTextStyle.textLMedium(AppColors.success700),)

                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                '\$${widget.recentJobModel.salary.substring(0, 2)}K',
                            style:
                                AppTextStyle.textLMedium(AppColors.success700),
                          ),
                          TextSpan(
                              text: '/Month',
                              style: TextStyle(
                                  color: AppColors.neutral500,
                                  fontSize: 12.sp,
                                  fontFamily: 'SFProDisplay',
                                  fontWeight: FontWeight.w500,
                                  fontFeatures: const [
                                    FontFeature.superscripts()
                                  ])),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
