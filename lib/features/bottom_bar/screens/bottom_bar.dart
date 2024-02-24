import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/applied/presentation/screens/applied_job.dart';
import 'package:flutter_application_1/features/homescreen/presentation/screens/homescreen.dart';
import 'package:flutter_application_1/features/messages/presentation/screens/message_screen.dart';
import 'package:flutter_application_1/features/profile_setting/presentation/screens/profile.dart';
import 'package:flutter_application_1/features/saved_notifications/presentation/screens/saved.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBar extends StatefulWidget {

 const BottomBar({super.key, });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int navIndex = 0;
  var svgUrl = AppAssets.svgUrl;
  

   List<Widget> barItems = [];

  @override
  void initState() {
    super.initState();
    // Initialize barItems with the appropriate widgets
    barItems = [
      HomeScreen(
      ),
      MessageScreen(),
      const AppliedJob(),
      Saved(),
      Profile(),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          bottom: 21.h,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType
              .fixed, // This ensures all labels are visible

          elevation: 0.0,
          unselectedLabelStyle:
              AppTextStyle.textXSRegular(AppColors.neutral400),
          selectedLabelStyle: AppTextStyle.textXSMedium(AppColors.primary500),
          currentIndex: navIndex,
          items: [
            BottomNavigationBarItem(
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: SvgPicture.asset('${svgUrl}active-home.svg'),
              ),
              icon: Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: SvgPicture.asset('${svgUrl}home.svg'),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: SvgPicture.asset('${svgUrl}active-message.svg'),
              ),
              icon: Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: SvgPicture.asset('${svgUrl}message.svg'),
              ),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: SvgPicture.asset('${svgUrl}active-briefcase.svg'),
              ),
              icon: Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: SvgPicture.asset('${svgUrl}briefcase.svg'),
              ),
              label: 'Applied',
            ),
            BottomNavigationBarItem(
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: SvgPicture.asset('${svgUrl}active-bookmark.svg'),
              ),
              icon: Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: SvgPicture.asset('${svgUrl}bottombookmark.svg'),
              ),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: SvgPicture.asset('${svgUrl}active-profile.svg'),
              ),
              icon: Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: SvgPicture.asset('${svgUrl}bottomprofile.svg'),
              ),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            setState(() {
              navIndex = index;
            });
          },
        ),
      ),
      body: barItems[navIndex],
    );
  }
}
