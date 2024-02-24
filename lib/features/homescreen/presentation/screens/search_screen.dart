import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/search_textfield.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/homescreen/controller/searchscreen_cubit.dart';
import 'package:flutter_application_1/features/homescreen/controller/searchscreen_states.dart';
import 'package:flutter_application_1/features/homescreen/presentation/widgets/filter_item_modal.dart';
import 'package:flutter_application_1/features/homescreen/presentation/widgets/filter_type_container.dart';
import 'package:flutter_application_1/features/homescreen/presentation/widgets/remote_modal.dart';
import 'package:flutter_application_1/features/homescreen/presentation/widgets/search_result_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class SearchScreen extends StatefulWidget {
  String textFieldText;
  SearchScreen({super.key, required this.textFieldText});

  @override
  // ignore: library_private_types_in_public_api
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchText = '';
  String svgUrl = AppAssets.svgUrl;
  String imgUrl = AppAssets.imageUrl;
  String prefixIconName = '${AppAssets.svgUrl}search-normal.svg';
  var searchBarController = TextEditingController();
  var jobTypeController = TextEditingController();
  var locationController = TextEditingController();
  FocusNode? _focusNode;
  List<String> jobTypes = [
    'Remote',
    'Full Time',
    'Post date',
    'Contract',
    'Part Time',
    'Onsite',
    'Internship'
  ];

  void onSearchSubmitted(String value) {
    setState(() {
      searchText = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    setState(() {
      _focusNode!.requestFocus();
    });

    setState(() {
      searchText = widget.textFieldText;
      searchBarController.text = widget.textFieldText;
      BlocProvider.of<SearchScreenCubit>(context)
          .getSearchResults(jobName: searchBarController.text);
    });
  }

  @override
  void dispose() {
    // Dispose the FocusNode when the widget is disposed
    _focusNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var myCubit = context.read<SearchScreenCubit>();
    return BlocBuilder<SearchScreenCubit, SearchScreenState>(
        builder: (context, state) {
      if (state is SearchResultLoading) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else if (state is SearchResultFailed) {
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
                                Navigator.pop(context);
                              },
                              child:
                                  SvgPicture.asset('${svgUrl}arrow_left.svg')),
                          SizedBox(
                            width: 291.w,
                            height: 48,
                            child: SearchTextfield(
                              hintText: 'Type something...',
                              onTap: () {
                                setState(() {
                                  searchBarController.text = '';
                                });
                              },
                              suffixIconName: '${svgUrl}close-circle-black.svg',
                              myController: searchBarController,
                              svgName: prefixIconName,
                              onSubmittedCallback: (value) {
                                myCubit.getSearchResults(jobName: value);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Text('Search Text: $searchText'),
                    Padding(
                      padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 20.h),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    jobTypeController.text = searchText;
                                  });
                                  showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.r),
                                          topRight: Radius.circular(20.r),
                                        ),
                                      ),
                                      builder: (context) {
                                        return FilterItem(
                                          jobNameController: jobTypeController,
                                          locationController:
                                              locationController,
                                          onFilterPress: (String salaryRange) {
                                            log(salaryRange);
                                            for (int salary = myCubit
                                                    .getMinSal(salaryRange);
                                                salary <=
                                                    myCubit
                                                        .getMaxSal(salaryRange);
                                                salary += 1000) {
                                              myCubit.getSearchResults(
                                                salary: salary.toString(),
                                                jobName: jobTypeController.text,
                                                location:
                                                    locationController.text,
                                              );
                                            }
                                            Navigator.pop(context);
                                            setState(() {
                                              searchBarController.text =
                                                  jobTypeController.text;
                                            });
                                          },
                                        );
                                      });
                                },
                                child: SvgPicture.asset('${svgUrl}filter.svg')),
                            SizedBox(
                              width: 16.w,
                            ),
                            for (int index = 0;
                                index < jobTypes.length;
                                index++)
                              Row(
                                children: [
                                  FilterTypeContainer(
                                      onPressed: () {
                                        if (index == 0 || index == 1) {
                                          showModalBottomSheet(
                                              context: context,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(20.r),
                                                  topRight:
                                                      Radius.circular(20.r),
                                                ),
                                              ),
                                              builder: (context) {
                                                return const RemoteModal();
                                              });
                                        }
                                      },
                                      containerColor: index == 0 || index == 1
                                          ? null
                                          : true,
                                      filterType: jobTypes[index]),
                                  SizedBox(
                                    width: 15.w,
                                  )
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 120.h,
                    ),
                    Center(child: Image.asset('${imgUrl}search_notfound.png')),
                    Padding(
                      padding: EdgeInsets.only(top: 24.h, bottom: 12.h),
                      child: Center(
                        child: Text(
                          'Search not found',
                          style: AppTextStyle.headingThreeMedium(
                              AppColors.neutral900),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Try searching with different keywords so',
                        style: AppTextStyle.textLRegular(AppColors.neutral500),
                      ),
                    ),
                    Center(
                      child: Text(
                        'we can show you',
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
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0.w, 14.h, 0.w, 0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(24.w, 22.h, 24.w, 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset('${svgUrl}arrow_left.svg')),
                      SizedBox(
                        width: 291.w,
                        height: 48,
                        child: SearchTextfield(
                          hintText: 'Type something...',
                          focusNode: _focusNode,
                          onSubmittedCallback: (value) {
                            myCubit.getSearchResults(jobName: value);
                          },
                          suffixIconName: '${svgUrl}close-circle-black.svg',
                          myController: searchBarController,
                          svgName: prefixIconName,
                          onTap: () {
                            setState(() {
                              searchBarController.text = '';
                            });
                          },
                          // onSubmittedCallback: onSearchSubmitted,
                        ),
                      ),
                    ],
                  ),
                ),

                // Text('Search Text: $searchText'),
                Padding(
                  padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 20.h),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {
                                jobTypeController.text = searchText;
                              });
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.r),
                                      topRight: Radius.circular(20.r),
                                    ),
                                  ),
                                  builder: (context) {
                                    return FilterItem(
                                      jobNameController: jobTypeController,
                                      locationController: locationController,
                                      onFilterPress: (String salaryRange) {
                                        log(salaryRange);
                                        // log('${myCubit.getMaxSal(salaryRange)}');
                                        // log('${myCubit.getMinSal(salaryRange)}');
                                        for (int salary =
                                                myCubit.getMinSal(salaryRange);
                                            salary <=
                                                myCubit.getMaxSal(salaryRange);
                                            salary += 1000) {
                                          // log('${myCubit.getMinSal(salaryRange)}');
                                          // log('${myCubit.getMaxSal(salaryRange)}');
                                          log(salary.toString());
                                          myCubit.getSearchResults(
                                            salary: salary.toString(),
                                            jobName: jobTypeController.text,
                                            location: locationController.text,
                                          );
                                        }
                                        Navigator.pop(context);
                                        setState(() {
                                          searchBarController.text =
                                              jobTypeController.text;
                                        });
                                      },
                                    );
                                  });
                            },
                            child: SvgPicture.asset('${svgUrl}filter.svg')),
                        SizedBox(
                          width: 16.w,
                        ),
                        for (int index = 0; index < jobTypes.length; index++)
                          Row(
                            children: [
                              FilterTypeContainer(
                                  onPressed: () {
                                    if (index == 0 || index == 1) {
                                      showModalBottomSheet(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20.r),
                                              topRight: Radius.circular(20.r),
                                            ),
                                          ),
                                          context: context,
                                          builder: (context) {
                                            return const RemoteModal();
                                          });
                                    }
                                  },
                                  containerColor:
                                      index == 0 || index == 1 ? null : true,
                                  filterType: jobTypes[index]),
                              SizedBox(
                                width: 15.w,
                              )
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.neutral200,
                      border:
                          Border.all(width: 1.w, color: AppColors.neutral100)),
                  child: Text(
                    'Featuring 120+ jobs',
                    style: AppTextStyle.textMMedium(AppColors.neutral500),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.fromLTRB(24.w, 13.h, 24.w, 0),
                  child: ListView.builder(
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: SearchResultContainer(
                            searchJobModel: myCubit.searchResultList[index],
                          ),
                        );
                      }),
                      // separatorBuilder: ((context, index) {
                      //   return Divider();
                      // }),
                      itemCount: myCubit.searchResultList.length),
                ))
              ],
            ),
          ),
        ),
      );
    });
  }
}
