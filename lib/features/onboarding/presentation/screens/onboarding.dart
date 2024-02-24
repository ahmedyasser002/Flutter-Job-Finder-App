import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/app_btn.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/create_account/presentation/screens/create_account.dart';
import 'package:flutter_application_1/features/onboarding/data/onboarding_sharedpref.dart';
import 'package:flutter_application_1/features/onboarding/presentation/widgets/boarding_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  var imageUrl = AppAssets.imageUrl;
  final PageController _controller = PageController(initialPage: 0);
  int _currentPageIndex = 0;
  String buttonText = 'Next';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: PageView(
                onPageChanged: (int index) {
                  setState(() {
                    _currentPageIndex = index;
                    if (_currentPageIndex == 2) {
                      buttonText = 'Get Started';
                    } else {
                      buttonText = 'Next';
                    }
                  });
                },
                controller: _controller,
                children: [
                  BoardingWidgets(
                    imageName: 'onboarding1.png',
                    boardingHeaders: RichText(
                        text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Find a job, and ',
                          style: AppTextStyle.headingOneMedium(
                              AppColors.neutral900),
                        ),
                        TextSpan(
                          text: 'start building ',
                          style: AppTextStyle.headingOneMedium(
                              AppColors.primary500),
                        ),
                        TextSpan(
                          text: 'your career from now on',
                          style: AppTextStyle.headingOneMedium(
                              AppColors.neutral900),
                        )
                      ],
                    )),
                    descriptionText:
                        'Explore over 25,924 available job roles and upgrade your operator now.',
                  ),
                  BoardingWidgets(
                    imageName: 'onboarding2.png',
                    boardingHeaders: RichText(
                        text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Hundreds of jobs are waiting for you to ',
                          style: AppTextStyle.headingOneMedium(
                              AppColors.neutral900),
                        ),
                        TextSpan(
                          text: 'join together ',
                          style: AppTextStyle.headingOneMedium(
                              AppColors.primary500),
                        ),
                      ],
                    )),
                    descriptionText:
                        'Immediately join us and start applying for the job you are interested in.',
                  ),
                  BoardingWidgets(
                    imageName: 'onboarding3.png',
                    boardingHeaders: RichText(
                        text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Get the best ',
                          style: AppTextStyle.headingOneMedium(
                              AppColors.neutral900),
                        ),
                        TextSpan(
                          text: 'choice for the job ',
                          style: AppTextStyle.headingOneMedium(
                              AppColors.primary500),
                        ),
                        TextSpan(
                          text: 'you\'ve always dreamed of',
                          style: AppTextStyle.headingOneMedium(
                              AppColors.neutral900),
                        )
                      ],
                    )),
                    descriptionText:
                        'The better the skills you have, the greater the good job opportunities for you.',
                  ),
                ]),
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: const SlideEffect(
                activeDotColor: AppColors.primary500,
                dotColor: AppColors.primary200,
                dotHeight: 10,
                dotWidth: 10),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(24.w, 36.h, 24.w, 56.h),
            child: AppBtn(
              btnText: buttonText,
              btnColor: AppColors.primary500,
              textColor: const Color(0xFFFFFFFF),
              onTap: () {
                setState(() {
                  _controller.nextPage(
                      duration: const Duration(milliseconds: 10),
                      curve: Curves.easeInOut);
                  _currentPageIndex++;
                  if (_currentPageIndex >= 2) {
                    buttonText = 'Get Started';
                  }
                  if (_currentPageIndex > 2) {
                    OnBoardingSharedPref.setBool(true);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateAccount()));
                  }
                });
              },
            ),
          )
        ],
      )),
    );
  }
}
