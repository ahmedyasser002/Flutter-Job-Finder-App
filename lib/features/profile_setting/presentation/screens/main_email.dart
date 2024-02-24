import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/app_btn.dart';
import 'package:flutter_application_1/core/components/app_textfield.dart';
import 'package:flutter_application_1/core/components/my_appbar.dart';
// import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class MainEmail extends StatelessWidget {
  var mailController = TextEditingController();

  MainEmail({super.key});
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
                    MyAppBar(title: 'Email address'),
                    Padding(
                      padding: EdgeInsets.only(top: 32.h, bottom: 12.h),
                      child: Text(
                        'Main e-mail address',
                        style: AppTextStyle.textLRegular(AppColors.neutral900),
                      ),
                    ),
                    SizedBox(
                      height: 56.h,
                      child: AppTextField(
                          hintText: 'Enter Your Email',
                          prefixIcon: 'sms.svg',
                          controller: mailController),
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
