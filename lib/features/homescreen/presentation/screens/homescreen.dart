import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/core/utils/local_storage_helper.dart';
import 'package:flutter_application_1/features/homescreen/controller/homescreen_cubit.dart';
import 'package:flutter_application_1/features/homescreen/controller/homescreen_states.dart';
import 'package:flutter_application_1/features/homescreen/presentation/screens/search_history.dart';
import 'package:flutter_application_1/features/homescreen/presentation/widgets/applied_notify.dart';
import 'package:flutter_application_1/features/homescreen/presentation/widgets/recent_job_container.dart';
import 'package:flutter_application_1/features/homescreen/presentation/widgets/suggested_container.dart';
import 'package:flutter_application_1/features/saved_notifications/presentation/screens/notfications.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
 const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var svgUrl = AppAssets.svgUrl;
  // List suggestedContainer = [SuggestedContainer(), SuggestedContainer()];
  String capitalize(String word) {
    List<String> newWord = word.split(' ');
    for (var i = 0; i < newWord.length; i++) {
      newWord[i] = newWord[i][0].toUpperCase() + newWord[i].substring(1);
    }
    String updatedWord = newWord.join(' ');
    return updatedWord;
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeScreenCubit>(context).getSuggestedJobs();
    BlocProvider.of<HomeScreenCubit>(context).getRecentJobs();
  }

  @override
  Widget build(BuildContext context) {
    var myCubit = context.read<HomeScreenCubit>();
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
        builder: (context, state) {
      if (state is GetSuggestedJobLoading || state is GetRecentJobLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      return SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.h, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${(capitalize(LocalStorageHelper.getStrings('name') as String))}👋',
                          style: AppTextStyle.headingThreeMedium(
                              AppColors.neutral900),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          'Create a better future for yourself here',
                          style: AppTextStyle.textMMedium(AppColors.neutral500),
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Notifications()));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100.r)),
                            border: Border.all(
                                width: 1.w, color: AppColors.neutral300)),
                        child: SvgPicture.asset('${svgUrl}notification.svg'),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 28.h),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchHistory()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    width: 327.w,
                    height: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100.r)),
                        border: Border.all(
                            width: 1.w, color: AppColors.neutral300)),
                    child: Row(
                      children: [
                        SvgPicture.asset('${svgUrl}search-normal.svg'),
                        SizedBox(
                          width: 12.w,
                        ),
                        Text(
                          'Search.....',
                          style:
                              AppTextStyle.textMRegular(AppColors.neutral400),
                        )
                      ],
                    ),
                  ),
                ),
                (LocalStorageHelper.getBool('apply') ?? false) == true
                    ? AppliedNotify()
                    : SizedBox(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Suggested Job',
                        style: AppTextStyle.headingFiveMedium(
                            AppColors.neutral900),
                      ),
                      Text(
                        'View All',
                        style: AppTextStyle.textMMedium(AppColors.primary500),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // for (var suggested in suggestedContainer)
                      //   Row(
                      //     children: [
                      //       suggested,
                      //       SizedBox(width: 16.w),
                      //     ],
                      //   ),
                      for (int index = 0;
                          index < myCubit.recentJobsList.length;
                          index++)
                        Row(
                          children: [
                            SuggestedContainer(
                                suggestedModel: myCubit.recentJobsList[index]),
                            SizedBox(
                              width: 15.w,
                            )
                          ],
                        )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24.h, bottom: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent Job',
                        style: AppTextStyle.headingFiveMedium(
                            AppColors.neutral900),
                      ),
                      Text(
                        'View All',
                        style: AppTextStyle.textMMedium(AppColors.primary500),
                      )
                    ],
                  ),
                ),

                for (int index = 0;
                    index < myCubit.recentJobsList.length;
                    index++)
                  Column(
                    children: [
                      RecentJobContainer(
                          recentJobModel: myCubit.recentJobsList[index]),
                      SizedBox(
                        height: 15.h,
                      )
                    ],
                  )
                // Container(
                //   decoration: BoxDecoration(
                //     border: Border(bottom: BorderSide(
                //       width: 1,
                //       color: AppColors.neutral200
                //     ))
                //   ),
                //   // child: Column(
                //   // //   children: [
                //   // //     Row(
                //   // //         children: [Text('Senior UI Engineer')],
                //   // //       ),
                //   // //       Text('data'),
                //   // // //        Divider(
                //   // // //   color: Colors.black,
                //   // // //   thickness: 1,
                //   // // //   height: 20,

                //   // // // )

                //   // //       ],

                //   // ),
                // ),
                // Expanded(
                //   child: ListView.separated(
                //       itemBuilder: (context, index) {
                //         return Container(
                //           child: Column(
                //             children: [
                //               Row(
                //                 children: [Text('Senior UI Engineer')],
                //               ),
                //               Text('data')
                //             ],
                //           ),
                //         );
                //       },
                //       separatorBuilder: (context, index) {
                //         return Divider(
                //           color: Colors.black,
                //           thickness: 1,
                //           height: 20,

                //         );
                //       },
                //       itemCount: 5),
                // )
              ],
            ),
          ),
        ),
      );
    });
  }
}
