import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/app_btn.dart';
import 'package:flutter_application_1/core/components/my_appbar.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/profile_setting/controller/profile_cubit.dart';
import 'package:flutter_application_1/features/profile_setting/controller/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var phoneController = TextEditingController();
  List<String> options = ['US.svg', 'google.svg', 'Facebook.svg'];
  String selectedOption = 'US.svg';
  Color focusColor = AppColors.primary500;
  var passTextColor = AppColors.neutral400;
  bool isNullFields = true;
  bool hasConfirmPassFocus = false;
  bool hasOldPassFocus = false;
  bool hasPassFocus = false;
  bool isChecked = false;
  final FocusNode _passFocusNode = FocusNode();
  final FocusNode _oldPassFocusNode = FocusNode();
  final FocusNode _confirmPassFocusNode = FocusNode();

  bool isObsecure = true;
  bool isObsPass = true;
  bool isObsConfirm = true;

  var oldPassController = TextEditingController();
  var passController = TextEditingController();
  var confirmPassController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passFocusNode.addListener(() {
      setState(() {
        hasPassFocus = _passFocusNode.hasFocus;
      });
    });
    _oldPassFocusNode.addListener(() {
      setState(() {
        hasOldPassFocus = _oldPassFocusNode.hasFocus;
      });
    });
    _confirmPassFocusNode.addListener(() {
      setState(() {
        hasConfirmPassFocus = _confirmPassFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    // Dispose of the focus nodes when they are no longer needed
    _passFocusNode.dispose();
    _confirmPassFocusNode.dispose();
    _oldPassFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var myCubit = context.read<ProfileCubit>();
    var svgUrl = AppAssets.svgUrl;
    return BlocConsumer<ProfileCubit, ProfileState>(listener: (context, state) {
      if (state is EditProfileSuccess &&
          passController.text == confirmPassController.text) {
        Navigator.pop(context);
      }
      // if (state is CheckingPassSuccess) {
      //   if (passController.text == confirmPassController.text) {
      //     if (state is EditProfileFailed || state is WrongPass) {
      //       passController.text = '';
      //       const snackBar = SnackBar(
      //         content:
      //             Text('Failed to update .. check your password or internet'),
      //       );
      //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //     } else if (state is EditProfileSuccess) {
      //       Navigator.pop(context);
      //     }
      //     // myCubit.updatePassword(passController.text);
      //     // if (state is EditProfileSuccess) {
      //     //   passController.text = '';
      //     //   const snackBar = SnackBar(
      //     //     content: Text('Success '),
      //     //   );
      //     //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //     //   Navigator.pop(context);
      //     // } else if (state is EditProfileFailed) {
      //     //   passController.text = '';
      //     //   const snackBar = SnackBar(
      //     //     content: Text('problem Occured '),
      //     //   );
      //     //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //     // }
      //   } else {
      //     passController.text = '';
      //     const snackBar = SnackBar(
      //       content: Text('Not Matching or length less than 8'),
      //     );
      //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //   }
      // } else if (state is WrongPass) {
      //   passController.text = '';
      //   const snackBar = SnackBar(
      //     content: Text('Wrong Old Passwrod'),
      //   );
      //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // }
    }, builder: (context, state) {
      if (state is CheckingPassLoading || state is EditProfileLoading) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
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
                      MyAppBar(title: 'Change password'),
                      Padding(
                        padding: EdgeInsets.only(top: 32.h, bottom: 8.h),
                        child: Text(
                          'Enter Your Old Password',
                          style: AppTextStyle.textLMedium(AppColors.neutral900),
                        ),
                      ),
                      TextField(
                        obscureText: isObsecure,
                        controller: oldPassController,
                        focusNode: _oldPassFocusNode,
                        onChanged: (value) {
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
                              child: hasOldPassFocus
                                  ? SvgPicture.asset(
                                      '${svgUrl}lock_activated.svg')
                                  : SvgPicture.asset('${svgUrl}lock.svg')),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: hasOldPassFocus
                                ? InkWell(
                                    onTap: () {
                                      setState(() {
                                        isObsecure = !isObsecure;
                                      });
                                    },
                                    child: isObsecure
                                        ? SvgPicture.asset(
                                            '${svgUrl}eye-slash-activated.svg')
                                        : SvgPicture.asset('${svgUrl}eye.svg'))
                                : SvgPicture.asset('${svgUrl}eye-slash.svg'),
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
                            borderSide: BorderSide(
                                color: AppColors.neutral300, width: 1.w),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.h, top: 16.h),
                        child: Text(
                          'Enter your new password',
                          style: AppTextStyle.textLMedium(AppColors.neutral900),
                        ),
                      ),
                      TextField(
                        obscureText: isObsPass,
                        controller: passController,
                        focusNode: _passFocusNode,
                        onChanged: (value) {
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
                                        isObsPass = !isObsPass;
                                      });
                                    },
                                    child: isObsPass
                                        ? SvgPicture.asset(
                                            '${svgUrl}eye-slash-activated.svg')
                                        : SvgPicture.asset('${svgUrl}eye.svg'))
                                : SvgPicture.asset('${svgUrl}eye-slash.svg'),
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
                            borderSide: BorderSide(
                                color: AppColors.neutral300, width: 1.w),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.h, top: 16.h),
                        child: Text(
                          'Confirm your new password',
                          style: AppTextStyle.textLMedium(AppColors.neutral900),
                        ),
                      ),
                      TextField(
                        obscureText: isObsConfirm,
                        controller: confirmPassController,
                        focusNode: _confirmPassFocusNode,
                        onChanged: (value) {
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
                              child: hasConfirmPassFocus
                                  ? SvgPicture.asset(
                                      '${svgUrl}lock_activated.svg')
                                  : SvgPicture.asset('${svgUrl}lock.svg')),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: hasConfirmPassFocus
                                ? InkWell(
                                    onTap: () {
                                      setState(() {
                                        isObsConfirm = !isObsConfirm;
                                      });
                                    },
                                    child: isObsConfirm
                                        ? SvgPicture.asset(
                                            '${svgUrl}eye-slash-activated.svg')
                                        : SvgPicture.asset('${svgUrl}eye.svg'))
                                : SvgPicture.asset('${svgUrl}eye-slash.svg'),
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
                            borderSide: BorderSide(
                                color: AppColors.neutral300, width: 1.w),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AppBtn(
                  btnText: 'Save',
                  btnColor: AppColors.primary500,
                  textColor: Colors.white,
                  onTap: () {
                    myCubit.updatePassword(
                        passController.text, oldPassController.text);
                  })
            ],
          ),
        )),
      );
    });
  }
}
