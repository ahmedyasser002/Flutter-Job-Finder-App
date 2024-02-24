import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/my_appbar.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/applied/presentation/widgets/active.dart';
import 'package:flutter_application_1/features/applied/presentation/widgets/rejected.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppliedJob extends StatelessWidget {
  const AppliedJob({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(24.w,16.h,24.w,16.h),
                child: MyAppBar(title: 'Applied Job' , isHome: true,),
              ),
              Padding(
                            padding: EdgeInsets.fromLTRB(24.w,10.h,24.w,16.h),
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
                                      text: 'Active',
                                    ),
                                    Tab(
                                      text: 'Rejected',
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
                               Active(),
                                // // Content of Tab 2
                                Rejected()
                              ],
                            ),
                          )
              
            ],
          ),
        ),
      ),
    );
  }
}
