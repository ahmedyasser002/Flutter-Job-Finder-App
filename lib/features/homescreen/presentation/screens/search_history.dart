import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/homescreen/controller/homescreen_cubit.dart';
import 'package:flutter_application_1/features/homescreen/controller/homescreen_states.dart';
import 'package:flutter_application_1/features/homescreen/presentation/screens/search_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class SearchHistory extends StatefulWidget {
  const SearchHistory({super.key});

  @override
  State<SearchHistory> createState() => _SearchHistoryState();
}

class _SearchHistoryState extends State<SearchHistory> {
  String svgUrl = AppAssets.svgUrl;

  var searchController = TextEditingController();

  List<String> searchList = [];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeScreenCubit>(context).getRecentJobs();
    // BlocProvider.of<HomeScreenCubit>(context).getSearchHistory();
  }

  @override
  Widget build(BuildContext context) {
    var myCubit = context.read<HomeScreenCubit>();
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
        builder: (context, state) {
      if (state is GetSuggestedJobLoading ||
          state is AddSearchHistoryLoading ||
          state is GetSearchHistoryLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      return Scaffold(
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.only(
            top: 16.h,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap:(){

                      Navigator.pop(context);
                      },
                      child: SvgPicture.asset('${svgUrl}arrow_left.svg')),
                    // SizedBox(
                    //   width: 12.w,
                    // ),
                    SizedBox(
                      width: 291.w,
                      height: 48,
                      child: TextField(
                        onSubmitted: (value) {
                          if (value.trim() != '') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchScreen(
                                          textFieldText: value,
                                        )));
                            searchController.text = '';
                            setState(() {
                              myCubit.searchHistory.add(value);
                              myCubit.addSearchHistory();
                              // myCubit.searchHistory.add(value);
                              // searchList.add(value);
                              // SearchHistorySharedPref.setSearchList(searchList);
                            });
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 12),
                              child: SvgPicture.asset(
                                  '${svgUrl}search-normal.svg')),
                          hintText: 'Type something...',
                          hintStyle:
                              AppTextStyle.textMRegular(AppColors.neutral400),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.neutral300, width: 1.w),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100.r)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.neutral300, width: 1.w),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100.r)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 22.h, bottom: 24.h),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.neutral200,
                      border:
                          Border.all(width: 1.w, color: AppColors.neutral100)),
                  child: Text(
                    'Recent searches',
                    style: AppTextStyle.textMMedium(AppColors.neutral500),
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        searchController.text = '';
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchScreen(
                                    textFieldText:
                                        myCubit.searchHistory[index])));
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Row(
                          children: [
                            SvgPicture.asset('${svgUrl}clock.svg'),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              myCubit.searchHistory[index],
                              style: AppTextStyle.textMRegular(
                                  AppColors.neutral900),
                            ),
                            const Spacer(),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    // myCubit.searchHistory
                                    //     .remove(myCubit.searchHistory[index]);
                                    myCubit.removeFromSearchHistory(
                                        myCubit.searchHistory[index]);
                                  });
                                },
                                child: SvgPicture.asset(
                                    '${svgUrl}close-circle.svg'))
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 18.h,
                    );
                  },
                  itemCount: myCubit.searchHistory
                      .length, // Replace with your actual item count
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 22.h, bottom: 24.h),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.neutral200,
                      border:
                          Border.all(width: 1.w, color: AppColors.neutral100)),
                  child: Text(
                    'Popular searches',
                    style: AppTextStyle.textMMedium(AppColors.neutral500),
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        children: [
                          SvgPicture.asset('${svgUrl}search-status.svg'),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            '${myCubit.recentJobsList[index].jobName}',
                            style:
                                AppTextStyle.textMRegular(AppColors.neutral900),
                          ),
                          const Spacer(),
                          SvgPicture.asset('${svgUrl}blue-arrow-right.svg')
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 18.h,
                    );
                  },
                  itemCount: myCubit.recentJobsList
                      .length, // Replace with your actual item count
                ),
              ),
            ],
          ),
        )),
      );
    });
  }
}
