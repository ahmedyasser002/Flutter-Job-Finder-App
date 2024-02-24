import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/job_type_container.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/apply_job/presentation/screens/apply_job.dart';
import 'package:flutter_application_1/features/apply_job/presentation/widgets/company.dart';
import 'package:flutter_application_1/features/apply_job/presentation/widgets/description.dart';
import 'package:flutter_application_1/features/apply_job/presentation/widgets/people.dart';
import 'package:flutter_application_1/features/homescreen/data/data_models/suggested_job_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class JobDetail extends StatelessWidget {
  var svgUrl = AppAssets.svgUrl;
  var imgUrl = AppAssets.imageUrl;
  SuggestedJobModel jobModel;

  JobDetail({super.key, required this.jobModel});
  @override
  Widget build(BuildContext context) {
    var trimmedLoc = jobModel.location!.split(',');
    var city = trimmedLoc[trimmedLoc.length - 2];

    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 0),
            child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child:
                                  SvgPicture.asset('${svgUrl}arrow_left.svg')),
                          Text(
                            'Job Detail',
                            style: AppTextStyle.headingFourMedium(
                                AppColors.neutral900),
                          ),
                          SvgPicture.asset('${svgUrl}filled-save.svg')
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Center(
                        child: SizedBox(
                          width: 40.w,
                          height: 40.w,
                          // decoration: BoxDecoration(
                          //     // color: Colors.blue,
                          //     borderRadius:
                          //         BorderRadius.all(Radius.circular(10.r))
                          //         ),
                          // // child: Image.asset(
                          // //   '${imgUrl}Twitter.png',
                          // //   fit: BoxFit.contain,
                          // // ),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r)),
                            child: Image.network(
                              '${jobModel.imageUrl}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Center(
                        child: Text(
                          '${jobModel.jobName}',
                          style: AppTextStyle.headingFourMedium(
                              AppColors.neutral900),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.h, bottom: 14.h),
                        child: Center(
                          child: Text(
                            '${jobModel.compName} • $city, ${trimmedLoc.last.replaceAll('.', '')}',
                            style:
                                AppTextStyle.textSRegular(AppColors.neutral700),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          JobTypeContainer(
                              jobType: '${jobModel.jobTimeType}',
                              color: AppColors.primary100,
                              horizontalPadding: 16),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: JobTypeContainer(
                                jobType: 'Onsite',
                                color: AppColors.primary100,
                                horizontalPadding: 16),
                          ),
                          JobTypeContainer(
                              jobType: '${jobModel.jobType}',
                              color: AppColors.primary100,
                              horizontalPadding: 16),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 24.h),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.neutral100,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100.r))),
                          child: TabBar(
                              indicator: BoxDecoration(
                                  color: AppColors.information900,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100.r))),
                              labelColor: Colors.white,
                              labelStyle:
                                  AppTextStyle.textMMedium(Colors.white),
                              unselectedLabelColor: AppColors.neutral500,
                              unselectedLabelStyle: AppTextStyle.textMMedium(
                                  AppColors.neutral500),
                              tabs: const [
                                Tab(
                                  text: 'Desicription',
                                ),
                                Tab(
                                  text: 'Company',
                                ),
                                Tab(
                                  text: 'People',
                                ),
                              ]),
                        ),
                      ),
                      SizedBox(
                        height: 0.6 * MediaQuery.of(context).size.height,
                        child: TabBarView(
                          physics:
                              const NeverScrollableScrollPhysics(), // disable scrolling for TabBarView

                          children: [
                            // Content of Tab 1
                            Description(
                              jobDesc: '${jobModel.jobDesc}',
                              jobSkill: '${jobModel.jobSkill}',
                            ),
                            // Content of Tab 2
                            Company(
                              compEmail: jobModel.compEmail!,
                              compWebsite: jobModel.compWebsite!,
                              aboutComp: jobModel.aboutComp!,
                            ),
                            // Content of Tab 3
                            People(
                              jobName: jobModel.jobName!,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 22.h,
                    child: InkWell(
                      onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ApplyJob(jobModel: jobModel,)));
                    },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 14.w, vertical: 15),
                        height: 48.h,
                        width: 327.w,
                        decoration: BoxDecoration(
                            color: AppColors.primary600,
                            borderRadius:
                                BorderRadius.all(Radius.circular(1000.r))),
                        child: Center(
                            child: Text(
                          'Apply now',
                          style: AppTextStyle.textLMedium(Colors.white),
                        )),
                      ),
                    ),
                  )
                ]),
          ),
        )),
      ),
    );
  }
}
