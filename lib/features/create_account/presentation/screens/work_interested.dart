import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/app_btn.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/create_account/presentation/screens/prefered_locations.dart';
import 'package:flutter_application_1/features/create_account/presentation/widgets/interested_work_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class WorkIntereted extends StatefulWidget {
  String email, password;
  WorkIntereted({super.key , required this.email , required this.password});

  @override
  State<WorkIntereted> createState() => _WorkInteretedState();
}

class _WorkInteretedState extends State<WorkIntereted> {
  String svgUrl = AppAssets.svgUrl;
  List<bool> containerPressed = List.generate(6, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 60.h, right: 24.w, left: 24.w),
          child: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'What type of work are you interested in?',
                    style:
                        AppTextStyle.headingThreeMedium(AppColors.neutral900),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: Text(
                      'Tell us what you’re interested in so we can customise the app for your needs.',
                      style: AppTextStyle.textLRegular(const Color(0xFF737379)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 36.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InterestedWorkContainer(
                          iconName: 'bezier.svg',
                          containerText: 'UI/UX Designer',
                          onTap: () {
                            setState(() {
                              containerPressed[0] = !containerPressed[0];
                            });
                          },
                          color: containerPressed[0]
                              ? AppColors.primary100
                              : const Color(0xFFFAFAFA),
                          borderColor: containerPressed[0]
                              ? AppColors.primary500
                              : AppColors.neutral300,
                          avatarContainerColor: containerPressed[0]
                              ? const Color(0xFFFFFFFF)
                              : const Color(0xFFFAFAFA),
                        ),
                        InterestedWorkContainer(
                          iconName: 'pen-tool-2.svg',
                          containerText: 'Ilustrator Designer',
                          onTap: () {
                            setState(() {
                              containerPressed[1] = !containerPressed[1];
                            });
                          },
                          color: containerPressed[1]
                              ? AppColors.primary100
                              : const Color(0xFFFAFAFA),
                          borderColor: containerPressed[1]
                              ? AppColors.primary500
                              : AppColors.neutral300,
                          avatarContainerColor: containerPressed[1]
                              ? const Color(0xFFFFFFFF)
                              : const Color(0xFFFAFAFA),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InterestedWorkContainer(
                          iconName: 'bezier.svg',
                          containerText: 'Developer',
                          onTap: () {
                            setState(() {
                              containerPressed[2] = !containerPressed[2];
                            });
                          },
                          color: containerPressed[2]
                              ? AppColors.primary100
                              : const Color(0xFFFAFAFA),
                          borderColor: containerPressed[2]
                              ? AppColors.primary500
                              : AppColors.neutral300,
                          avatarContainerColor: containerPressed[2]
                              ? const Color(0xFFFFFFFF)
                              : const Color(0xFFFAFAFA),
                        ),
                        InterestedWorkContainer(
                          iconName: 'pen-tool-2.svg',
                          containerText: 'Management',
                          onTap: () {
                            setState(() {
                              containerPressed[3] = !containerPressed[3];
                            });
                          },
                          color: containerPressed[3]
                              ? AppColors.primary100
                              : const Color(0xFFFAFAFA),
                          borderColor: containerPressed[3]
                              ? AppColors.primary500
                              : AppColors.neutral300,
                          avatarContainerColor: containerPressed[3]
                              ? const Color(0xFFFFFFFF)
                              : const Color(0xFFFAFAFA),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InterestedWorkContainer(
                        iconName: 'bezier.svg',
                        containerText: 'Information Technology',
                        onTap: () {
                          setState(() {
                            containerPressed[4] = !containerPressed[4];
                          });
                        },
                        color: containerPressed[4]
                            ? AppColors.primary100
                            : const Color(0xFFFAFAFA),
                        borderColor: containerPressed[4]
                            ? AppColors.primary500
                            : AppColors.neutral300,
                        avatarContainerColor: containerPressed[4]
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xFFFAFAFA),
                      ),
                      InterestedWorkContainer(
                        iconName: 'pen-tool-2.svg',
                        containerText: 'Research and Analytics',
                        onTap: () {
                          setState(() {
                            containerPressed[5] = !containerPressed[5];
                          });
                        },
                        color: containerPressed[5]
                            ? AppColors.primary100
                            : const Color(0xFFFAFAFA),
                        borderColor: containerPressed[5]
                            ? AppColors.primary500
                            : AppColors.neutral300,
                        avatarContainerColor: containerPressed[5]
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xFFFAFAFA),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 66.h, bottom: 18.h),
                    child: AppBtn(
                        btnText: 'Next',
                        btnColor: AppColors.primary500,
                        textColor: const Color(0xFFFFFFFF),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      PreferedLocations(email: widget.email , password: widget.password,))));
                        }),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
