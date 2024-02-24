import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/bottom_bar/screens/bottom_bar.dart';
import 'package:flutter_application_1/features/saved_notifications/controller/saved_cubit.dart';
import 'package:flutter_application_1/features/saved_notifications/controller/saved_state.dart';
import 'package:flutter_application_1/features/saved_notifications/presentation/widgets/saved_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class Saved extends StatelessWidget {
  var svgUrl = AppAssets.svgUrl;
  var imgUrl = AppAssets.imageUrl;
  Saved({super.key});

  @override
  Widget build(BuildContext context) {
    var myCubit = context.read<SavedCubit>();
    return BlocBuilder<SavedCubit, SavedState>(builder: (context, state) {
      if (state is GetSavedLoading) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else if (state is GetSavedFailed) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.w, 14.h, 0.w, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(24.w, 22.h, 24.w, 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                // Navigator.pop(context);
                                Navigator.pushAndRemoveUntil(
                                    context, MaterialPageRoute(builder: (context)=>BottomBar()), (route) => false);
                              },
                              child:
                                  SvgPicture.asset('${svgUrl}arrow_left.svg')),
                          Expanded(
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Saved',
                                    style: AppTextStyle.headingFourMedium(
                                        AppColors.neutral900),
                                  )))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 120.h,
                    ),
                    Center(child: Image.asset('${imgUrl}empty_save.png')),
                    Padding(
                      padding: EdgeInsets.only(top: 24.h, bottom: 12.h),
                      child: Center(
                        child: Text(
                          'Nothing has been saved yet',
                          style: AppTextStyle.headingThreeMedium(
                              AppColors.neutral900),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Press the star icon on the job you want to save.',
                        style: AppTextStyle.textLRegular(AppColors.neutral500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
      return SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 16.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                          Navigator.pushAndRemoveUntil(
                                    context, MaterialPageRoute(builder: (context)=>BottomBar()), (route) => false);
                      },
                      child: SvgPicture.asset('${svgUrl}arrow_left.svg')),
                  Expanded(
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Saved     ',
                            style: AppTextStyle.headingFourMedium(
                                AppColors.neutral900),
                          )))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 22.h, bottom: 24.h),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.neutral200,
                    border:
                        Border.all(width: 1.w, color: AppColors.neutral100)),
                child: Center(
                  child: Text(
                    '${myCubit.savedJobs.length} Job Saved',
                    style: AppTextStyle.textMMedium(AppColors.neutral500),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: SavedContainer(savedModel: myCubit.savedJobs[index]),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 18.h,
                  );
                },
                itemCount: myCubit
                    .savedJobs.length, // Replace with your actual item count
              ),
            ),
          ],
        ),
      ));
    });
  }
}
