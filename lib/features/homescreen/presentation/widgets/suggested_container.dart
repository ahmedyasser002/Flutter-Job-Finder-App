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
class SuggestedContainer extends StatefulWidget {
  SuggestedJobModel suggestedModel;
  SuggestedContainer({super.key, required this.suggestedModel});

  @override
  State<SuggestedContainer> createState() => _SuggestedContainerState();
}

class _SuggestedContainerState extends State<SuggestedContainer> {
  var imgUrl = AppAssets.imageUrl;

  var svgUrl = AppAssets.svgUrl;


  @override
  Widget build(BuildContext context) {
      var myCubit = context.read<SavedCubit>();
    return BlocBuilder<SavedCubit,SavedState>(
      builder: (context, snapshot) {
        return Container(
          width: widget.suggestedModel.jobName!.length < 15 ? 300.w : 328.w,
          padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
          decoration: BoxDecoration(
            color: AppColors.primary900,
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // Image.asset('${imgUrl}zoom-logo.png'),
                      // Container(
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.all(Radius.circular(8.r))),
                      //   child: Image.network(
                      //     '${suggestedModel.imageUrl}',
                      //     width: 28.w,
                      //     height: 28.h,
                      //   ),
                      // ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.all(Radius.circular(8.r)),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(8.r)),
                            child: Image.network(
                              '${widget.suggestedModel.imageUrl}',
                              width: 28,
                              height: 28,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
    
                      Padding(
                        padding: EdgeInsets.only(left: 22.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.suggestedModel.jobName}',
                              style: AppTextStyle.headingFiveMedium(
                                  const Color(0xFFFFFFFF)),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              '${widget.suggestedModel.compName} •  ${widget.suggestedModel.location!.split(',').last.trim()} ',
                              style:
                                  AppTextStyle.textSRegular(AppColors.neutral400),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                       setState(() {
                              if (myCubit.isSaved(widget.suggestedModel.jobID!) ==
                                  false) {
                                // recentJobModel.jobName;
                                myCubit.addFavourite(
                                    id: widget.suggestedModel.jobID!);
                              } else {
                                log('saved before');
                              }
                            });
                    },
                  
                    child: myCubit.isSaved(widget.suggestedModel.jobID!)
                              ? SvgPicture.asset('${svgUrl}filled-save.svg')
                              : SvgPicture.asset('${svgUrl}bookmark.svg')
                    
                    )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 22.5.h, bottom: 24.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    JobTypeContainer(
                      jobType: '${widget.suggestedModel.jobTimeType}',
                      color: const Color.fromRGBO(255, 255, 255, 0.14),
                      horizontalPadding: 23,
                    ),
                    JobTypeContainer(
                      jobType: 'Remote',
                      color: const Color.fromRGBO(255, 255, 255, 0.14),
                      horizontalPadding: 23,
                    ),
                    JobTypeContainer(
                      jobType: '${widget.suggestedModel.jobType}',
                      color: const Color.fromRGBO(255, 255, 255, 0.14),
                      horizontalPadding: 23,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              '\$${int.parse(widget.suggestedModel.salary.substring(0, 2)) - 3}k-${widget.suggestedModel.salary.substring(0, 2)}k',
                          style: AppTextStyle.headingFourMedium(
                              const Color(0xFFFFFFFF)),
                        ),
                        const TextSpan(
                            text: '/Month',
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 0.5),
                                fontSize: 12,
                                fontFeatures: [FontFeature.superscripts()])),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => JobDetail(jobModel: widget.suggestedModel)));
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(1000.r)),
                          color: AppColors.primary500),
                      child: Text(
                        'Apply now',
                        style: AppTextStyle.textSMedium(const Color(0xFFFFFFFF)),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      }
    );
  }
}
