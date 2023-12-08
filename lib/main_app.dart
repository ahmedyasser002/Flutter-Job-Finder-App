import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(375,812),
      child: MaterialApp(
       debugShowCheckedModeBanner: false,
       home: SplashScreen(),
      ),
    );
  }
}
