import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/app_btn.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/bottom_bar/screens/bottom_bar.dart';
import 'package:flutter_application_1/features/create_account/presentation/screens/create_account.dart';
import 'package:flutter_application_1/features/create_account/presentation/widgets/sign_in_container.dart';
import 'package:flutter_application_1/features/forgot_password/presentation/screens/reset_password.dart';
import 'package:flutter_application_1/features/sign_in/controller/login_cubit.dart';
import 'package:flutter_application_1/features/sign_in/controller/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
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
    var myCubit = context.read<LoginCubit>();
    return BlocConsumer<LoginCubit, LoggingState>(listener: (context, state) {
      if (state is LoginSuccessState) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Logged In Successfully')));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) =>  BottomBar()));
      } else if (state is LoginFailedState) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Register Failed')));
      }
    }, builder: (context, state) {
      if (state is LoginLoadingState) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(right: 24.w, left: 24.w, top: 16.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
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
                        'Login',
                        style:
                            AppTextStyle.headingTwoMedium(AppColors.neutral900),
                      ),
                    ),
                    Text(
                      'Please login to find your dream job',
                      style: AppTextStyle.textLRegular(AppColors.neutral500),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 41.h),
                      child: TextField(
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
                              padding:
                                  const EdgeInsets.only(left: 16, right: 12),
                              child: hasUserFocus
                                  ? SvgPicture.asset('${svgUrl}frame.svg')
                                  : SvgPicture.asset('${svgUrl}profile.svg')),
                          hintText: 'Username',
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
                    SizedBox(
                      height: 16.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: TextField(
                        obscureText: isObsecure,
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
                            borderSide:
                                BorderSide(color: focusColor, width: 1.w),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r)),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: CupertinoCheckbox(
                            value: isChecked,
                            onChanged: (newVal) {
                              setState(() {
                                isChecked = newVal!;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12.w),
                          child: Text(
                            'Remember me',
                            style:
                                AppTextStyle.textMRegular(AppColors.neutral800),
                          ),
                        ),
                        Expanded(
                            child: Text(
                          'Forgot Password?',
                          style:
                              AppTextStyle.textMRegular(AppColors.primary500),
                          textAlign: TextAlign.end,
                        ))
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 173.h, bottom: 24.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account ? ',
                            style:
                                AppTextStyle.textMMedium(AppColors.neutral400),
                          ),
                          InkWell(
                            onTap: () {
                              
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CreateAccount()));
                            },
                            child: Text(
                              'Register',
                              style: AppTextStyle.textMMedium(
                                  AppColors.primary500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppBtn(
                        btnText: 'Login',
                        btnColor: isNullFields
                            ? AppColors.neutral300
                            : AppColors.primary500,
                        textColor: isNullFields
                            ? AppColors.neutral500
                            : const Color(0xFFFFFFFF),
                        onTap: () {
                          isNullFields
                              ? null
                              : myCubit.loginUser(
                                  nameController.text, passController.text);
                        }),
                    Padding(
                      padding: EdgeInsets.only(top: 4.h),
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Divider(
                              color: AppColors
                                  .neutral300, // Customize the color as needed
                              thickness:
                                  1.0, // Customize the thickness as needed
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              child: Text(
                                'Or Login With Account',
                                style: AppTextStyle.textMRegular(AppColors
                                    .neutral500), // Customize the text color as needed
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              color: AppColors
                                  .neutral300, // Customize the color as needed
                              thickness:
                                  1.0, // Customize the thickness as needed
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 24.h, bottom: 37.h),
                      child: Row(
                        children: [
                          SignInContainer(
                            svgUrl: '${svgUrl}google.svg',
                            accType: 'Google',
                          ),
                          SizedBox(
                            width: 19.w,
                          ),
                          SignInContainer(
                              svgUrl: '${svgUrl}Facebook.svg',
                              accType: 'Facebook')
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(right: 24.w, left: 24.w, top: 16.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                      'Login',
                      style:
                          AppTextStyle.headingTwoMedium(AppColors.neutral900),
                    ),
                  ),
                  Text(
                    'Please login to find your dream job',
                    style: AppTextStyle.textLRegular(AppColors.neutral500),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 41.h),
                    child: TextField(
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
                                ? SvgPicture.asset('${svgUrl}frame.svg')
                                : SvgPicture.asset('${svgUrl}profile.svg')),
                        hintText: 'Username',
                        hintStyle:
                            AppTextStyle.textMRegular(AppColors.neutral400),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.neutral300, width: 1.w),
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: focusColor, width: 1.w),
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: TextField(
                      obscureText: isObsecure,
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
                            padding: const EdgeInsets.only(left: 16, right: 12),
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
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: focusColor, width: 1.w),
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20.w,
                        height: 20.h,
                        child: CupertinoCheckbox(
                          value: isChecked,
                          onChanged: (newVal) {
                            setState(() {
                              isChecked = newVal!;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12.w),
                        child: Text(
                          'Remember me',
                          style:
                              AppTextStyle.textMRegular(AppColors.neutral800),
                        ),
                      ),
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const ResetPassword())));
                        },
                        child: Text(
                          'Forgot Password?',
                          style:
                              AppTextStyle.textMRegular(AppColors.primary500),
                          textAlign: TextAlign.end,
                        ),
                      ))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 173.h, bottom: 24.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account ? ',
                          style: AppTextStyle.textMMedium(AppColors.neutral400),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CreateAccount()));
                          },
                          child: Text(
                            'Register',
                            style:
                                AppTextStyle.textMMedium(AppColors.primary500),
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppBtn(
                      btnText: 'Login',
                      btnColor: isNullFields
                          ? AppColors.neutral300
                          : AppColors.primary500,
                      textColor: isNullFields
                          ? AppColors.neutral500
                          : const Color(0xFFFFFFFF),
                      onTap: () {
                        if (isChecked) {
                          myCubit.setisRememberMe(isChecked);
                        }
                        isNullFields
                            ? null
                            : myCubit.loginUser(
                                nameController.text, passController.text);
                      }),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            color: AppColors
                                .neutral300, // Customize the color as needed
                            thickness: 1.0, // Customize the thickness as needed
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: Text(
                              'Or Login With Account',
                              style: AppTextStyle.textMRegular(AppColors
                                  .neutral500), // Customize the text color as needed
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            color: AppColors
                                .neutral300, // Customize the color as needed
                            thickness: 1.0, // Customize the thickness as needed
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24.h, bottom: 37.h),
                    child: Row(
                      children: [
                        SignInContainer(
                          svgUrl: '${svgUrl}google.svg',
                          accType: 'Google',
                        ),
                        SizedBox(
                          width: 19.w,
                        ),
                        SignInContainer(
                            svgUrl: '${svgUrl}Facebook.svg',
                            accType: 'Facebook')
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
