import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/saved_notifications/controller/notify_cubit.dart';
import 'package:flutter_application_1/features/saved_notifications/controller/notify_state.dart';
import 'package:flutter_application_1/features/saved_notifications/presentation/widgets/notific_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  String svgUrl = AppAssets.svgUrl;
  var imgUrl = AppAssets.imageUrl;

  var searchController = TextEditingController();

  List<String> searchList = [];
  List notifies = [
    NotiContainer(
      notifiContent: 'Posted new design jobs',
      notificImg: 'Dana.png',
      notificName: 'Dana',
      notificTime: '10:00AM',
    ),
    NotiContainer(
      notifiContent: 'Posted new design jobs',
      notificImg: 'Shoope.png',
      notificName: 'Shoope',
      notificTime: '10:00AM',
    ),
    NotiContainer(
      notifiContent: 'Posted new design jobs',
      notificImg: 'Slack.png',
      notificName: 'Slack',
      notificTime: '10:00AM',
    ),
    NotiContainer(
      notifiContent: 'Posted new design jobs',
      notificImg: 'Facebook.png',
      notificName: 'Facebook',
      notificTime: '10:00AM',
    ),
  ];
  List notifYesterday = [
    NotiContainer(
      notifiContent:
          'Your email setup was successful with the following details: Your new email is rafifdianganz@gmail.com.',
      notificImg: 'sms.png',
      notificName: 'Email setup successful',
      notificTime: '10:00AM',
      isYesterday: true,
    ),
    NotiContainer(
      notifiContent:
          'Hello Rafif Dian Axelingga, thank you for registering Jobsque. Enjoy the various features that....',
      notificImg: 'search-status.png',
      notificName: 'Welcome to Jobsque',
      notificTime: '10:00AM',
      isYesterday: true,
      isActive: false,
    ),
  ];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotifyCubit>(context).isEmptyNotify();
  }

  @override
  Widget build(BuildContext context) {
    var myCubit = context.read<NotifyCubit>();
    return BlocBuilder<NotifyCubit, NotifyState>(builder: (context, state) {
      if (state is EmptyNotificationsState) {
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
                          Expanded(
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Notifications',
                                    style: AppTextStyle.headingFourMedium(
                                        AppColors.neutral900),
                                  )))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 120.h,
                    ),
                    Center(child: Image.asset('${imgUrl}emptyNotify.png')),
                    Padding(
                      padding: EdgeInsets.only(top: 24.h, bottom: 12.h),
                      child: Center(
                        child: Text(
                          'No new notifications yet',
                          style: AppTextStyle.headingThreeMedium(
                              AppColors.neutral900),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'You will receive a notification if there is ',
                        style: AppTextStyle.textLRegular(AppColors.neutral500),
                      ),
                    ),
                    Center(
                      child: Text(
                        'something on your account',
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
          padding: EdgeInsets.only(
            top: 16.h,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset('${svgUrl}arrow_left.svg')),
                    Expanded(
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Notifications',
                              style: AppTextStyle.headingFourMedium(
                                  AppColors.neutral900),
                            )))
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
                    'New',
                    style: AppTextStyle.textMMedium(AppColors.neutral500),
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: myCubit.notifyList[index],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 18.h,
                    );
                  },
                  itemCount: myCubit
                      .notifyList.length, // Replace with your actual item count
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
                    'Yesterday',
                    style: AppTextStyle.textMMedium(AppColors.neutral500),
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: myCubit.yesterdayNotify[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 18.h,
                    );
                  },
                  itemCount: myCubit.yesterdayNotify
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
