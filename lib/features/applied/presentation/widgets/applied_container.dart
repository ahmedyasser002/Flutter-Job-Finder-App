import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/job_type_container.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/apply_job/presentation/screens/apply_job.dart';
import 'package:flutter_application_1/features/apply_job/presentation/widgets/progress_container.dart';
import 'package:flutter_application_1/features/homescreen/data/data_models/suggested_job_model.dart';
import 'package:flutter_application_1/features/saved_notifications/controller/saved_cubit.dart';
import 'package:flutter_application_1/features/saved_notifications/controller/saved_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class AppliedContainer extends StatelessWidget {
  SuggestedJobModel appliedModel;
  AppliedContainer({super.key, required this.appliedModel});

  @override
  Widget build(BuildContext context) {
    var svgUrl = AppAssets.svgUrl;
    var myCubit = context.read<SavedCubit>();

    return BlocBuilder<SavedCubit, SavedState>(builder: (context, state) {
      if (state is GetSavedLoading || state is AddSavedLoading) {
        return CircularProgressIndicator();
      }
      return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ApplyJob(
                        jobModel: appliedModel,
                        isApplied: true,
                      )));
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Container(
            padding: EdgeInsets.only(bottom: 10.h),
            decoration: BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(width: 1.w, color: AppColors.neutral200))),
            child: Column(
              children: [
                // First Row
                Row(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        child: Image.network(
                          '${appliedModel.imageUrl}',
                          width: 28,
                          height: 28,
                          // fit: BoxFit.cover, // You can adjust the BoxFit property as needed
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 18.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appliedModel.jobName!,
                          style: AppTextStyle.headingFiveMedium(
                              AppColors.neutral900),
                        ),
                        Text(
                          '${appliedModel.compName} • ${appliedModel.location!.split(',')[appliedModel.location!.split(',').length - 2].trim()},  ${appliedModel.location!.split(',').last.trim()}',
                          style:
                              AppTextStyle.textSRegular(AppColors.neutral700),
                        ),
                      ],
                    ),
                    const Spacer(),
                    myCubit.isSaved(appliedModel.jobID!)
                        ? SvgPicture.asset('${svgUrl}filled-save.svg')
                        : InkWell(
                            onTap: () {
                              myCubit.addFavourite(id: appliedModel.jobID!);
                            },
                            child:
                                SvgPicture.asset('${svgUrl}black-archive.svg'))
                  ],
                ),
                SizedBox(height: 18.h),
                // Second Row
                Row(
                  children: [
                    JobTypeContainer(
                      jobType: appliedModel.jobTimeType!,
                      color: AppColors.primary100,
                      horizontalPadding: 16,
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    JobTypeContainer(
                      jobType: 'Remote',
                      color: AppColors.primary100,
                      horizontalPadding: 16,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                // Third Row
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      border:
                          Border.all(width: 1.w, color: AppColors.neutral300)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset('${svgUrl}Vector.svg'),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Biodata',
                            style:
                                AppTextStyle.textSRegular(AppColors.primary500),
                          )
                        ],
                      ),
                      SvgPicture.asset('${svgUrl}Line.svg'),
                      Column(
                        children: [
                          ProgressContainer(isTurn: false, stepNo: '2'),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Type of work',
                            style:
                                AppTextStyle.textSRegular(AppColors.neutral900),
                          )
                        ],
                      ),
                      SvgPicture.asset('${svgUrl}Line.svg'),
                      Column(
                        children: [
                          ProgressContainer(isTurn: false, stepNo: '3'),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Upload Portfolio',
                            style:
                                AppTextStyle.textSRegular(AppColors.neutral900),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
