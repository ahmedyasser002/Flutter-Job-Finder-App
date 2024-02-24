import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/app_btn.dart';
import 'package:flutter_application_1/core/components/my_appbar.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/apply_job/controller/apply_cubit.dart';
import 'package:flutter_application_1/features/apply_job/controller/apply_state.dart';
import 'package:flutter_application_1/features/bottom_bar/screens/bottom_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class DoneApplying extends StatelessWidget {
  DoneApplying({super.key});

  @override
  Widget build(BuildContext context) {
    var myCubit = context.read<ApplyCubit>();
    var imgUrl = AppAssets.imageUrl;
    return BlocBuilder<ApplyCubit, ApplyState>(builder: (context, state) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0.w, 14.h, 0.w, 22.h),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                            padding:
                                EdgeInsets.fromLTRB(24.w, 22.h, 24.w, 20.h),
                            child: MyAppBar(title: 'Apply Job')),
                        SizedBox(
                          height: 120.h,
                        ),
                        Center(child: Image.asset('${imgUrl}done.png')),
                        Padding(
                          padding: EdgeInsets.only(top: 24.h, bottom: 8.h),
                          child: Center(
                            child: Text(
                              'Your data has been ',
                              style: AppTextStyle.headingThreeMedium(
                                  AppColors.neutral900),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Successfully sent',
                            style: AppTextStyle.headingThreeMedium(
                                AppColors.neutral900),
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Center(
                            child: Text(
                              'You will get a message from our team, about the announcement of employee acceptance',
                              style: AppTextStyle.textLRegular(
                                  AppColors.neutral500),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AppBtn(
                    btnText: 'Back to home',
                    btnColor: AppColors.primary500,
                    textColor: Colors.white,
                    onTap: () {
                      myCubit.applyNotify(true);
                      Navigator.pushAndRemoveUntil(
                          context,
                          (MaterialPageRoute(
                              builder: (context) =>const BottomBar())),
                          (route) => false);
                    })
              ],
            ),
          ),
        ),
      );
    });
  }
}
