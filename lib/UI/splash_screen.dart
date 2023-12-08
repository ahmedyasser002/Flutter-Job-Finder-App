import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_application_1/UI/onboarding.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Container(
            decoration: const BoxDecoration(
            color: Color.fromARGB(255, 124, 214, 255),
        
              shape: BoxShape.circle
            ),
            child: Image.asset('assets/splash_logo.png'),
        ),
        splashIconSize: 250,
        backgroundColor: Colors.white,
        nextScreen: const Onboarding());
  }
}