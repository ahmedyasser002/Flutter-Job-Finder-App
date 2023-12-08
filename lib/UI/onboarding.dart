import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/boarding_pages/boarding.dart';
import 'package:flutter_application_1/UI/sign_up.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final _controller = PageController(initialPage: 0);
  int _currentPageIndex = 0;
  String buttonText = 'Next';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 24, left: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/splash_logo.png',
                        width: 81,
                        height: 19,
                      ),
                      const Text(
                        'Skip',
                        style:
                            TextStyle(color: Color(0xFF6B7280), fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: PageView(
                  controller: _controller,
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
                  children: [
                    Boarding(
                      imageUrl: 'assets/boarding_one.png',
                      richText: RichText(
                        text: const TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: 'Find a job, and ',
                            style: TextStyle(color: Colors.black, fontSize: 34),
                          ),
                          TextSpan(
                            text: 'start building ',
                            style: TextStyle(
                                color: Color(0xFF3366FF), fontSize: 34),
                          ),
                          TextSpan(
                            text: 'your career from now on',
                            style: TextStyle(color: Colors.black, fontSize: 34),
                          )
                        ]),
                      ),
                      descriptionText:
                          'Explore over 25,924 available job roles and upgrade your operator now.',
                    ),
                    Boarding(
                      imageUrl: 'assets/boarding_two.png',
                      richText: RichText(
                        text: const TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: 'Hundreds of jobs are waiting for you to ',
                            style: TextStyle(color: Colors.black, fontSize: 34),
                          ),
                          TextSpan(
                            text: 'join together ',
                            style: TextStyle(
                                color: Color(0xFF3366FF), fontSize: 34),
                          ),
                        ]),
                      ),
                      descriptionText:
                          'Immediately join us and start applying for the job you are interested in.',
                    ),
                    Boarding(
                      imageUrl: 'assets/boarding_three.png',
                      richText: RichText(
                        text: const TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: 'Get the best ',
                            style: TextStyle(color: Colors.black, fontSize: 34),
                          ),
                          TextSpan(
                            text: 'Choice for the job ',
                            style: TextStyle(
                                color: Color(0xFF3366FF), fontSize: 34),
                          ),
                          TextSpan(
                            text: 'you\'ve always dreamed of',
                            style: TextStyle(color: Colors.black, fontSize: 34),
                          )
                        ]),
                      ),
                      descriptionText:
                          'The better the skills you have, the greater the good job opportunities for you.',
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: const SlideEffect(
                        activeDotColor: Color(0xFF3366FF),
                        dotColor: Color(0xFFADC8FF),
                        dotHeight: 10,
                        dotWidth: 10),
                  ),
                ),
              ),
              InkWell(
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const SignUp()));
                    }
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 38),
                  height: 48,
                  width: 327,
                  // padding: const EdgeInsets.fromLTRB(15, 14, 15, 14),
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: Center(child: Text(buttonText)),
                ),
              ),
            ],
          ),
        ));
  }
}
