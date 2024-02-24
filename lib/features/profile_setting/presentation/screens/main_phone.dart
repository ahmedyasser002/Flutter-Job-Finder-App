import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/app_btn.dart';
import 'package:flutter_application_1/core/components/my_appbar.dart';
import 'package:flutter_application_1/core/components/phone_textfield.dart';
// import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class MainPhone extends StatefulWidget {
  const MainPhone({super.key});

  @override
  State<MainPhone> createState() => _MainPhoneState();
}

class _MainPhoneState extends State<MainPhone> {
  var mailController = TextEditingController();
  var phoneController = TextEditingController();
  List<String> options = ['US.svg', 'google.svg', 'Facebook.svg'];
  String selectedOption = 'US.svg';
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    // var svgUrl = AppAssets.svgUrl;
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
                    MyAppBar(title: 'Phone number'),
                    Padding(
                      padding: EdgeInsets.only(top: 32.h, bottom: 12.h),
                      child: Text(
                        'Main e-mail address',
                        style: AppTextStyle.textLRegular(AppColors.neutral900),
                      ),
                    ),
                    PhoneTextfield(phoneController: phoneController),
                    Padding(
                      padding: EdgeInsets.only(top: 16.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Use the phone number to reset your\npassword',
                            style: AppTextStyle.textMMedium(AppColors.neutral500) ,
                           // You can use other values like ellipsis or fade if you prefer

                            ),
                          CupertinoSwitch(
                            activeColor: AppColors.primary500,
                            trackColor: AppColors.neutral300,
                            value: switchValue,
                            onChanged: (value) {
                              setState(() {
                                switchValue = value;
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            AppBtn(
                btnText: 'Save',
                btnColor: AppColors.primary500,
                textColor: Colors.white,
                onTap: () {
                  Navigator.pop(context);
                })
          ],
        ),
      )),
    );
  }
}
