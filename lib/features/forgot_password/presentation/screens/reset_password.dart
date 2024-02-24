import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/app_btn.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/core/utils/validate.dart';
import 'package:flutter_application_1/features/forgot_password/presentation/screens/check_mail.dart';
import 'package:flutter_application_1/features/sign_in/presentation/screens/login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  var svgUrl = AppAssets.svgUrl;

  var imageUrl = AppAssets.imageUrl;

  Color focusColor = AppColors.primary500;
  var passTextColor = AppColors.neutral400;
  bool isNullFields = true;
  bool hasUserFocus = false;
  final FocusNode _userFocusNode = FocusNode();

  bool isObsecure = true;

  var nameController = TextEditingController();
  var mailController = TextEditingController();
  var passController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Listen for focus changes
    _userFocusNode.addListener(() {
      setState(() {
        hasUserFocus = _userFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    // Dispose of the focus nodes when they are no longer needed
    _userFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      '${svgUrl}arrow_left.svg',
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                  Image.asset(
                    '${imageUrl}splash_logo.png',
                    width: 81.w,
                    height: 19.h,
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 39.h, bottom: 8.h),
                child: Text(
                  'Reset Password',
                  style: AppTextStyle.headingTwoMedium(AppColors.neutral900),
                ),
              ),
              Text(
                'Enter the email address you used when you joined and we’ll send you instructions to reset your password.',
                style: AppTextStyle.textLRegular(AppColors.neutral500),
              ),
              SizedBox(
                height: 40.h,
              ),
              TextField(
                focusNode: _userFocusNode,
                controller: nameController,
                onChanged: (value) {
                  if (value.length < 8) {
                    setState(() {
                      focusColor = AppColors.danger500;
                    });
                  } else {
                    setState(() {
                      focusColor = AppColors.primary500;
                    });
                  }
                  if (value.isNotEmpty) {
                    setState(() {
                      isNullFields = false;
                    });
                  } else {
                    setState(() {
                      isNullFields = true;
                    });
                  }
                },
                decoration: InputDecoration(
                  prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 12),
                      child: hasUserFocus
                          ? SvgPicture.asset('${svgUrl}sms_activated.svg')
                          : SvgPicture.asset('${svgUrl}sms.svg')),
                  hintText: 'Enter your email....',
                  hintStyle: AppTextStyle.textMRegular(AppColors.neutral400),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.neutral300, width: 1.w),
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: focusColor, width: 1.w),
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 355.h, bottom: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You remember your password ',
                      style: AppTextStyle.textMMedium(AppColors.neutral400),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const Login())));
                        },
                        child: Text(
                          'Login',
                          style: AppTextStyle.textMMedium(AppColors.primary500),
                        ))
                  ],
                ),
              ),
              AppBtn(
                  btnText: 'Request password reset',
                  btnColor: AppColors.primary500,
                  textColor: const Color(0xFFFFFFFF),
                  onTap: () {
                    if (Validate.validateEmail(nameController.text)) {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckMail()));
                    }
                  })
            ],
          ),
        ),
      )),
    );
  }
}
