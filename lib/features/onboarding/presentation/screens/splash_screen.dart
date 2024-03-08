import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/utils/local_storage_helper.dart';
import 'package:flutter_application_1/features/bottom_bar/screens/bottom_bar.dart';
import 'package:flutter_application_1/features/onboarding/presentation/screens/onboarding.dart';
import 'package:flutter_application_1/features/sign_in/presentation/screens/login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var imageUrl = AppAssets.imageUrl;
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Image.asset(
              '${imageUrl}splash_circle.png',
              height: 700.h,
              width: 701.31.w,
              fit: BoxFit.fill,
            ),
            Image.asset('${imageUrl}splash_logo.png'),
          ],
        ),
        splashIconSize: 700,
        // backgroundColor: Color.fromARGB(241, 130, 130, 156),
        nextScreen: LocalStorageHelper.getBool('Remember') == true
            ? const BottomBar()
            : (LocalStorageHelper.getBool('board') ?? false) == true
                ? const Login()
                : const Onboarding());
  }
}
