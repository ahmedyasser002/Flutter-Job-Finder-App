import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/app_btn.dart';
import 'package:flutter_application_1/core/components/my_appbar.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class LastTwoStep extends StatefulWidget {
  String phoneNumber;

  LastTwoStep({super.key, required this.phoneNumber});
  @override
  _LastTwoStepState createState() => _LastTwoStepState();
}

class _LastTwoStepState extends State<LastTwoStep> {
  int counter = 60;
  late Timer timer;
  bool timeEnd = false;
  List<TextEditingController> controllers = List.generate(
      6, (index) => TextEditingController()); // Create 6 text field controllers

  String phoneObsecure(String phone) {
    String obsecureText = '';
    phone = phone.replaceAll('-', '');
    for (int i = 0; i < phone.length; i++) {
      if (phone.length - i <= 3) {
        obsecureText += phone[i];
      } else {
        obsecureText += '*';
      }
      if ((i + 1) % 4 == 0 && (i + 1) < phone.length) {
        obsecureText += '_';
      }
    }

    return obsecureText;
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (counter > 0) {
        setState(() {
          counter--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void resetTimer() {
    setState(() {
      counter = 60;
    });
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 22.h),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyAppBar(title: 'Two-step verification'),
                      Padding(
                        padding: EdgeInsets.only(top: 46.h, bottom: 16.h),
                        child: Text(
                          'Enter the 6-digit code',
                          style: AppTextStyle.textLMedium(AppColors.neutral900),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            // TextSpan for the first part with one color
                            TextSpan(
                                text:
                                    'Please confirm your account by entering the authorization code sent to ',
                                style: AppTextStyle.textMRegular(
                                    AppColors.neutral500)),
                            // TextSpan for the obscured phone number with another color
                            TextSpan(
                              text: phoneObsecure(widget.phoneNumber),
                              style: AppTextStyle.textMRegular(
                                  AppColors.neutral900),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 24.h, bottom: 12.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            6,
                            (index) => SizedBox(
                              width: 44.w,
                              child: TextField(
                                decoration: InputDecoration(
                                    counterText: '',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.r)),
                                        borderSide: BorderSide(
                                            width: 1.w,
                                            color: AppColors.neutral300))),
                                controller: controllers[index],
                                textAlign: TextAlign.center,
                                maxLength: 1,
                                onChanged: (value) {
                                  // Move focus to the next text field
                                  if (value.isNotEmpty) {
                                    if (index < 5) {
                                      FocusScope.of(context)
                                          .nextFocus(); // Move focus to the next text field
                                    } else {
                                      // If the last digit is entered, submit the code
                                      // String verificationCode = controllers
                                      //     .map((controller) => controller.text)
                                      //     .join();
                                      // // print('Verification Code: $verificationCode');
                                      // // Implement your verification logic here
                                    }
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            'Resend code',
                            style:
                                AppTextStyle.textLMedium(AppColors.neutral400),
                          ),
                          // Conditionally display Resend Code button or Countdown timer
                          counter == 0
                              ? InkWell(
                                  onTap: () {
                                    resetTimer();
                                  },
                                  child: Text('Press again',
                                      style: AppTextStyle.textLMedium(
                                          AppColors.primary500)),
                                )
                              : Text('${counter}s',
                                  style: AppTextStyle.textLMedium(
                                      AppColors.primary500)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              AppBtn(
                  btnText: 'Verify',
                  btnColor: AppColors.primary500,
                  textColor: Colors.white,
                  onTap: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
