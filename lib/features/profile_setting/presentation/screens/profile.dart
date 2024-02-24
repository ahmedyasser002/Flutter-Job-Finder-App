import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/core/utils/local_storage_helper.dart';
import 'package:flutter_application_1/features/bottom_bar/screens/bottom_bar.dart';
import 'package:flutter_application_1/features/complete_profile/presentation/screens/complete_profile.dart';
import 'package:flutter_application_1/features/profile_setting/controller/profile_cubit.dart';
import 'package:flutter_application_1/features/profile_setting/controller/profile_state.dart';
import 'package:flutter_application_1/features/profile_setting/presentation/screens/edit_profile.dart';
import 'package:flutter_application_1/features/profile_setting/presentation/screens/help_center.dart';
import 'package:flutter_application_1/features/profile_setting/presentation/screens/language.dart';
import 'package:flutter_application_1/features/profile_setting/presentation/screens/login_security.dart';
import 'package:flutter_application_1/features/profile_setting/presentation/screens/notifcation_profile.dart';
import 'package:flutter_application_1/features/profile_setting/presentation/screens/portfolio.dart';
import 'package:flutter_application_1/features/profile_setting/presentation/screens/privacy_policy.dart';
import 'package:flutter_application_1/features/profile_setting/presentation/screens/terms_conditions.dart';
import 'package:flutter_application_1/features/profile_setting/presentation/widgets/general_container.dart';
import 'package:flutter_application_1/features/profile_setting/presentation/widgets/others_container.dart';
import 'package:flutter_application_1/features/sign_in/presentation/screens/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  var imgUrl = AppAssets.imageUrl;
  var svgUrl = AppAssets.svgUrl;
  Profile({super.key});
  void onInkWell(Widget widget, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  String capitalize(String word) {
    List<String> newWord = word.split(' ');
    for (var i = 0; i < newWord.length; i++) {
      newWord[i] = newWord[i][0].toUpperCase() + newWord[i].substring(1);
    }
    String updatedWord = newWord.join(' ');
    return updatedWord;
  }

  @override
  Widget build(BuildContext context) {
    var myCubit = context.read<ProfileCubit>();

    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      if (state is GetProfileDetailsLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    height: 195,
                    decoration:
                        const BoxDecoration(color: AppColors.primary100),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const BottomBar()),
                                    (route) => false);
                              },
                              child:
                                  SvgPicture.asset('${svgUrl}arrow_left.svg')),
                          Text(
                            'Profile',
                            style: AppTextStyle.headingFourMedium(
                                AppColors.neutral900),
                          ),
                          InkWell(
                              onTap: () {
                                myCubit.logOut();
                                Navigator.pushAndRemoveUntil(
                                    context, MaterialPageRoute(builder: (context)=>const Login()), (route) => false);
                              },
                              child: SvgPicture.asset('${svgUrl}logout.svg'))
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -45,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CircleAvatar(
                          radius: 45,
                          backgroundImage: myCubit.img == null
                              ? null
                              : FileImage(myCubit.img!),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Center(
                child: Text(
                  capitalize(myCubit.profileModel!.name!),
                  style: AppTextStyle.headingFourMedium(AppColors.neutral900),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Center(
                child: Text(
                  LocalStorageHelper.getStrings('bio') ?? "",
                  style: AppTextStyle.textMMedium(AppColors.neutral500),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Container(
                  padding: EdgeInsets.fromLTRB(3.w, 0, 3.w, 0),
                  color: AppColors.neutral100,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Applied',
                              style: AppTextStyle.textMMedium(
                                  AppColors.neutral500),
                            ),
                            Text(
                              '46',
                              style: AppTextStyle.headingFourMedium(
                                  AppColors.neutral900),
                            )
                          ],
                        ),
                        Container(
                          height: 30.h,
                          width: 1.w,
                          color: AppColors.neutral300,
                        ),
                        Column(
                          children: [
                            Text(
                              'Reviewed',
                              style: AppTextStyle.textMMedium(
                                  AppColors.neutral500),
                            ),
                            Text('23',
                                style: AppTextStyle.headingFourMedium(
                                    AppColors.neutral900))
                          ],
                        ),
                        Container(
                          height: 30.h,
                          width: 1.w,
                          color: AppColors.neutral300,
                        ),
                        Column(
                          children: [
                            Text(
                              'Contacted',
                              style: AppTextStyle.textMMedium(
                                  AppColors.neutral500),
                            ),
                            Text('16',
                                style: AppTextStyle.headingFourMedium(
                                    AppColors.neutral900))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: 24.w, left: 24.w, top: 24.h, bottom: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'About',
                      style: AppTextStyle.textLMedium(AppColors.neutral500),
                    ),
                    Text(
                      'Edit',
                      style: AppTextStyle.textMMedium(AppColors.primary500),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 16.h),
                child: Text(
                  'I\'m Rafif Dian Axelingga, I’m UI/UX Designer, I have experience designing UI Design for approximately 1 year. I am currently joining the Vektora studio team based in Surakarta, Indonesia.I am a person who has a high spirit and likes to work to achieve what I dream of.',
                  style: AppTextStyle.textMMedium(AppColors.neutral500),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.neutral200,
                    border:
                        Border.all(width: 1.w, color: AppColors.neutral100)),
                child: Text(
                  'General',
                  style: AppTextStyle.textMMedium(AppColors.neutral500),
                ),
              ),
              InkWell(
                onTap: () {
                  (LocalStorageHelper.getIntegers('progress') ?? 0) < 100
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CompleteProfile()))
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfile()));
                },
                child: GeneralContainer(
                  generalIcon: 'blueProfile.svg',
                  generalText: 'Edit Profile',
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Portfolio()));
                },
                child: GeneralContainer(
                  generalIcon: 'folder-favorite.svg',
                  generalText: 'Portfolio',
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Language()));
                },
                child: GeneralContainer(
                  generalIcon: 'global.svg',
                  generalText: 'Langauge',
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationProfile()));
                },
                child: GeneralContainer(
                  generalIcon: 'blueNoti.svg',
                  generalText: 'Notification',
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginSecurity()));
                },
                child: GeneralContainer(
                  generalIcon: 'blueLock.svg',
                  generalText: 'Login and security',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.neutral200,
                      border:
                          Border.all(width: 1.w, color: AppColors.neutral100)),
                  child: Text(
                    'Others',
                    style: AppTextStyle.textMMedium(AppColors.neutral500),
                  ),
                ),
              ),
              OthersContainer(othersText: 'Accesibility'),
              InkWell(
                  onTap: () {
                    onInkWell(const HelpCenter(), context);
                  },
                  child: OthersContainer(othersText: 'Help Center')),
              InkWell(
                  onTap: () {
                    onInkWell(TermsConditions(), context);
                  },
                  child: OthersContainer(othersText: 'Terms & Conditions')),
              InkWell(
                  onTap: () {
                    onInkWell(const PrivacyPolicy(), context);
                  },
                  child: OthersContainer(othersText: 'Privacy Policy')),
            ],
          ),
        ),
      );
    });
  }
}
