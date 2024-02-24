import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/app_btn.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/create_account/presentation/screens/acc_setup.dart';
import 'package:flutter_application_1/features/create_account/presentation/widgets/country_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class PreferedLocations extends StatefulWidget {
  String email, password;
  PreferedLocations({super.key , required this.email , required this.password});

  @override
  State<PreferedLocations> createState() => _PreferedLocationsState();
}

class _PreferedLocationsState extends State<PreferedLocations> {
  bool isRemote = false;
  String imgUrl = AppAssets.imageUrl;
  List<bool> containerPressed = List.generate(13, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 60.h, 22.w, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Where are you prefefred Location?',
                style: AppTextStyle.headingThreeMedium(AppColors.neutral900),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.h, bottom: 32.h),
                child: Text(
                    'Let us know, where is the work location you want at this time, so we can adjust it.',
                    style: AppTextStyle.textLRegular(const Color(0xFF737379))),
              ),
              Container(
                width: 327.w,
                padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
                decoration: BoxDecoration(
                    color: AppColors.neutral100,
                    borderRadius: BorderRadius.all(Radius.circular(100.r))),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isRemote = false;
                        });
                      },
                      child: Container(
                        width: 160.5.w,
                        padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.w, 10.h),
                        decoration: BoxDecoration(
                          color: isRemote
                              ? AppColors.neutral100
                              : AppColors.primary900,
                          borderRadius:
                              BorderRadius.all(Radius.circular(100.r)),
                          // border: Border(bottom: BorderSide(width: 1.w , color: AppColors.neutral100))
                        ),
                        child: Center(
                            child: Text(
                          'Work From Office',
                          style: AppTextStyle.textMMedium(isRemote
                              ? AppColors.neutral500
                              : const Color(0xFFFFFFFF)),
                        )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isRemote = true;
                        });
                      },
                      child: Container(
                        width: 160.5.w,
                        padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.w, 10.h),
                        decoration: BoxDecoration(
                          color: isRemote
                              ? AppColors.primary900
                              : AppColors.neutral100,
                          borderRadius:
                              BorderRadius.all(Radius.circular(100.r)),
                          // border: Border(bottom: BorderSide(width: 1.w))
                        ),
                        child: Center(
                          child: Text('Remote Work',
                              style: AppTextStyle.textMMedium(
                                isRemote
                                    ? const Color(0xFFFFFFFF)
                                    : AppColors.neutral500,
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.h, bottom: 20.h),
                child: Text(
                  'Select the country you want for your job',
                  style: AppTextStyle.textLRegular(const Color(0xFF737379)),
                ),
              ),
              Row(
                children: [
                  CountryContainer(
                    countryFlag: '${imgUrl}usa.png',
                    countryName: 'United States',
                    onTap: () {
                      setState(() {
                        containerPressed[0] = !containerPressed[0];
                      });
                    },
                    containerColor: containerPressed[0]
                        ? AppColors.primary100
                        : const Color(0xFFFAFAFA),
                    borderColor: containerPressed[0]
                        ? AppColors.primary500
                        : AppColors.neutral200,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  CountryContainer(
                    countryFlag: '${imgUrl}malysia.png',
                    countryName: 'Malysia',
                    onTap: () {
                      setState(() {
                        containerPressed[1] = !containerPressed[1];
                      });
                    },
                    containerColor: containerPressed[1]
                        ? AppColors.primary100
                        : const Color(0xFFFAFAFA),
                    borderColor: containerPressed[1]
                        ? AppColors.primary500
                        : AppColors.neutral200,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
                child: Row(
                  children: [
                    CountryContainer(
                      countryFlag: '${imgUrl}singapore.png',
                      countryName: 'Singapore',
                      onTap: () {
                        setState(() {
                          containerPressed[2] = !containerPressed[2];
                        });
                      },
                      containerColor: containerPressed[2]
                          ? AppColors.primary100
                          : const Color(0xFFFAFAFA),
                      borderColor: containerPressed[2]
                          ? AppColors.primary500
                          : AppColors.neutral200,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    CountryContainer(
                      countryFlag: '${imgUrl}indonesia.png',
                      countryName: 'Indonesia',
                      onTap: () {
                        setState(() {
                          containerPressed[3] = !containerPressed[3];
                        });
                      },
                      containerColor: containerPressed[3]
                          ? AppColors.primary100
                          : const Color(0xFFFAFAFA),
                      borderColor: containerPressed[3]
                          ? AppColors.primary500
                          : AppColors.neutral200,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  CountryContainer(
                    countryFlag: '${imgUrl}phill.png',
                    countryName: 'Philiphines',
                    onTap: () {
                      setState(() {
                        containerPressed[4] = !containerPressed[4];
                      });
                    },
                    containerColor: containerPressed[4]
                        ? AppColors.primary100
                        : const Color(0xFFFAFAFA),
                    borderColor: containerPressed[4]
                        ? AppColors.primary500
                        : AppColors.neutral200,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  CountryContainer(
                    countryFlag: '${imgUrl}poland.png',
                    countryName: 'Polandia',
                    onTap: () {
                      setState(() {
                        containerPressed[5] = !containerPressed[5];
                      });
                    },
                    containerColor: containerPressed[5]
                        ? AppColors.primary100
                        : const Color(0xFFFAFAFA),
                    borderColor: containerPressed[5]
                        ? AppColors.primary500
                        : AppColors.neutral200,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
                child: Row(
                  children: [
                    CountryContainer(
                      countryFlag: '${imgUrl}india.png',
                      countryName: 'India',
                      onTap: () {
                        setState(() {
                          containerPressed[6] = !containerPressed[6];
                        });
                      },
                      containerColor: containerPressed[6]
                          ? AppColors.primary100
                          : const Color(0xFFFAFAFA),
                      borderColor: containerPressed[6]
                          ? AppColors.primary500
                          : AppColors.neutral200,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    CountryContainer(
                      countryFlag: '${imgUrl}vietnam.png',
                      countryName: 'Vietnam',
                      onTap: () {
                        setState(() {
                          containerPressed[7] = !containerPressed[7];
                        });
                      },
                      containerColor: containerPressed[7]
                          ? AppColors.primary100
                          : const Color(0xFFFAFAFA),
                      borderColor: containerPressed[7]
                          ? AppColors.primary500
                          : AppColors.neutral200,
                    ),
                    SizedBox(
                      width: 11.w,
                    ),
                    CountryContainer(
                      countryFlag: '${imgUrl}china.png',
                      countryName: 'Chin',
                      onTap: () {
                        setState(() {
                          containerPressed[8] = !containerPressed[8];
                        });
                      },
                      containerColor: containerPressed[8]
                          ? AppColors.primary100
                          : const Color(0xFFFAFAFA),
                      borderColor: containerPressed[8]
                          ? AppColors.primary500
                          : AppColors.neutral200,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  CountryContainer(
                    countryFlag: '${imgUrl}canada.png',
                    countryName: 'Canada',
                    onTap: () {
                      setState(() {
                        containerPressed[9] = !containerPressed[9];
                      });
                    },
                    containerColor: containerPressed[9]
                        ? AppColors.primary100
                        : const Color(0xFFFAFAFA),
                    borderColor: containerPressed[9]
                        ? AppColors.primary500
                        : AppColors.neutral200,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  CountryContainer(
                    countryFlag: '${imgUrl}saudi.png',
                    countryName: 'Saudi Arabia',
                    onTap: () {
                      setState(() {
                        containerPressed[10] = !containerPressed[10];
                      });
                    },
                    containerColor: containerPressed[10]
                        ? AppColors.primary100
                        : const Color(0xFFFAFAFA),
                    borderColor: containerPressed[10]
                        ? AppColors.primary500
                        : AppColors.neutral200,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.h, bottom: 63.h),
                child: Row(
                  children: [
                    CountryContainer(
                      countryFlag: '${imgUrl}argentina.png',
                      countryName: 'Argentina',
                      onTap: () {
                        setState(() {
                          containerPressed[11] = !containerPressed[11];
                        });
                      },
                      containerColor: containerPressed[11]
                          ? AppColors.primary100
                          : const Color(0xFFFAFAFA),
                      borderColor: containerPressed[11]
                          ? AppColors.primary500
                          : AppColors.neutral200,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    CountryContainer(
                      countryFlag: '${imgUrl}brazil.png',
                      countryName: 'Brazil',
                      onTap: () {
                        setState(() {
                          containerPressed[12] = !containerPressed[12];
                        });
                      },
                      containerColor: containerPressed[12]
                          ? AppColors.primary100
                          : const Color(0xFFFAFAFA),
                      borderColor: containerPressed[12]
                          ? AppColors.primary500
                          : AppColors.neutral200,
                    ),
                  ],
                ),
              ),
              AppBtn(
                  btnText: 'Next',
                  btnColor: AppColors.primary500,
                  textColor: const Color(0xFFFFFFFF),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AccSetup(email: widget.email , password: widget.password,)));
                  })
            ],
          ),
        ),
      )),
    );
  }
}
