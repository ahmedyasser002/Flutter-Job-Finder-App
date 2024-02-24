import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/app_btn.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/core/utils/validate.dart';
import 'package:flutter_application_1/features/forgot_password/presentation/screens/pass_changed.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class NewPass extends StatefulWidget {
  const NewPass({super.key});

  @override
  State<NewPass> createState() => NewPassState();
}

class NewPassState extends State<NewPass> {
  String svgUrl = AppAssets.svgUrl;
  String imageUrl = AppAssets.imageUrl;
  Color focusColor = AppColors.primary500;
  var passTextColor = AppColors.neutral400;
  bool isNullFields = true;
  bool hasUserFocus = false;
  bool hasMailFocus = false;
  bool hasPassFocus = false;
  bool isChecked = false;

  final FocusNode _userFocusNode = FocusNode();
  final FocusNode _mailFocusNode = FocusNode();
  final FocusNode _passFocusNode = FocusNode();

  bool isObsecure1 = true;
  bool isObsecure2 = true;

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

    _mailFocusNode.addListener(() {
      setState(() {
        hasMailFocus = _mailFocusNode.hasFocus;
      });
    });

    _passFocusNode.addListener(() {
      setState(() {
        hasPassFocus = _passFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    // Dispose of the focus nodes when they are no longer needed
    _userFocusNode.dispose();
    _mailFocusNode.dispose();
    _passFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(right: 24.w, left: 24.w, top: 16.h, bottom: 16.h),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset('${svgUrl}arrow_left.svg'),
                          Image.asset(
                            '${imageUrl}splash_logo.png',
                            width: 81.w,
                            height: 19.h,
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.h, top: 41.h),
                        child: Text(
                          'Create new password',
                          style: AppTextStyle.headingTwoMedium(
                              AppColors.neutral900),
                        ),
                      ),
                      Text(
                        'Set your new password so you can login and acces Jobsque',
                        style: AppTextStyle.textLRegular(AppColors.neutral500),
                      ),
                      SizedBox(
                        height: 41.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: TextField(
                          obscureText: isObsecure1,
                          controller: mailController,
                          focusNode: _mailFocusNode,
                          onChanged: (value) {
                            if (value.length < 8) {
                              setState(() {
                                focusColor = AppColors.danger500;
                                passTextColor = AppColors.danger500;
                              });
                            } else {
                              setState(() {
                                focusColor = AppColors.primary500;
                                passTextColor = AppColors.success500;
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
                            // prefixIconConstraints: BoxConstraints(maxHeight: 36.h , maxWidth: 36.w),
                            prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, right: 12),
                                child: hasMailFocus
                                    ? SvgPicture.asset(
                                        '${svgUrl}lock_activated.svg')
                                    : SvgPicture.asset('${svgUrl}lock.svg')),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: hasMailFocus
                                  ? InkWell(
                                      onTap: () {
                                        setState(() {
                                          isObsecure1 = !isObsecure1;
                                        });
                                      },
                                      child: isObsecure1
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: SvgPicture.asset(
                                                  '${svgUrl}eye-slash-activated.svg'),
                                            )
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: SvgPicture.asset(
                                                  '${svgUrl}eye.svg'),
                                            ))
                                  : Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: SvgPicture.asset(
                                          '${svgUrl}eye-slash.svg'),
                                    ),
                            ),
                            // suffixIconConstraints: BoxConstraints(maxHeight: 20.h , maxWidth: 20.w),
                            hintText: 'Password',
                            hintStyle:
                                AppTextStyle.textMRegular(AppColors.neutral400),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.neutral300, width: 1.w),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.r)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: focusColor, width: 1.w),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.r)),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Password must be at least 8 characters',
                        style: AppTextStyle.textLRegular(AppColors.neutral400),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: TextField(
                          obscureText: isObsecure2,
                          controller: passController,
                          focusNode: _passFocusNode,
                          onChanged: (value) {
                            if (value.length < 8) {
                              setState(() {
                                focusColor = AppColors.danger500;
                                passTextColor = AppColors.danger500;
                              });
                            } else {
                              setState(() {
                                focusColor = AppColors.primary500;
                                passTextColor = AppColors.success500;
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
                            // prefixIconConstraints: BoxConstraints(maxHeight: 36.h , maxWidth: 36.w),
                            prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, right: 12),
                                child: hasPassFocus
                                    ? SvgPicture.asset(
                                        '${svgUrl}lock_activated.svg')
                                    : SvgPicture.asset('${svgUrl}lock.svg')),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: hasPassFocus
                                  ? InkWell(
                                      onTap: () {
                                        setState(() {
                                          isObsecure2 = !isObsecure2;
                                        });
                                      },
                                      child: isObsecure2
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: SvgPicture.asset(
                                                  '${svgUrl}eye-slash-activated.svg'),
                                            )
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: SvgPicture.asset(
                                                  '${svgUrl}eye.svg'),
                                            ))
                                  : Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: SvgPicture.asset(
                                          '${svgUrl}eye-slash.svg'),
                                    ),
                            ),
                            // suffixIconConstraints: BoxConstraints(maxHeight: 20.h , maxWidth: 20.w),
                            hintText: 'Password',
                            hintStyle:
                                AppTextStyle.textMRegular(AppColors.neutral400),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.neutral300, width: 1.w),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.r)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: focusColor, width: 1.w),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.r)),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Both password must match',
                        style: AppTextStyle.textLRegular(AppColors.neutral400),
                      ),
                    ],
                  ),
                ),
              ),
              AppBtn(
                  btnText: 'Reset password',
                  btnColor: isNullFields
                      ? AppColors.neutral300
                      : AppColors.primary500,
                  textColor: isNullFields
                      ? AppColors.neutral500
                      : const Color(0xFFFFFFFF),
                  onTap: () {
                    if (Validate.validatePass(passController.text) &&
                        Validate.validatePass(mailController.text) &&
                        mailController.text == passController.text) {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> PassChanged()));
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
