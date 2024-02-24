import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/app_btn.dart';
import 'package:flutter_application_1/core/components/my_appbar.dart';
import 'package:flutter_application_1/core/components/phone_textfield.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/profile_setting/controller/profile_cubit.dart';
import 'package:flutter_application_1/features/profile_setting/controller/profile_state.dart';
import 'package:flutter_application_1/features/profile_setting/presentation/screens/last_two_step.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TwoStepThree extends StatefulWidget {
  const TwoStepThree({super.key});

  @override
  State<TwoStepThree> createState() => _TwoStepThreeState();
}

class _TwoStepThreeState extends State<TwoStepThree> {
  var phoneController = TextEditingController();
  List<String> options = ['US.svg', 'google.svg', 'Facebook.svg'];
  String selectedOption = 'US.svg';
  Color focusColor = AppColors.primary500;
  var passTextColor = AppColors.neutral400;
  bool isNullFields = true;
  bool hasUserFocus = false;
  bool hasMailFocus = false;
  bool hasPassFocus = false;
  bool isChecked = false;
  final FocusNode _passFocusNode = FocusNode();

  bool isObsecure = true;

  var nameController = TextEditingController();
  var mailController = TextEditingController();
  var passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passFocusNode.addListener(() {
      setState(() {
        hasPassFocus = _passFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    // Dispose of the focus nodes when they are no longer needed
    _passFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var myCubit = context.read<ProfileCubit>();
    var svgUrl = AppAssets.svgUrl;
    return BlocConsumer<ProfileCubit, ProfileState>(listener: (context, state) {
      if (state is CheckingPassSuccess) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LastTwoStep(phoneNumber: phoneController.text,)));
      } else if (state is WrongPass) {
        passController.text = '';
        const snackBar = SnackBar(
          content: Text('Wrong Passwrod'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }, builder: (context, state) {
      if (state is CheckingPassLoading) {
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
                      MyAppBar(title: 'Two-step verification'),
                      Padding(
                        padding: EdgeInsets.only(top: 22.h, bottom: 8.h),
                        child: Text(
                          'Add phone number',
                          style: AppTextStyle.textLMedium(AppColors.neutral900),
                        ),
                      ),
                      Text(
                        'We will send a verification code to this number',
                        style: AppTextStyle.textMRegular(AppColors.neutral500),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        child: PhoneTextfield(phoneController: phoneController),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: Text(
                          'Enter your password',
                          style: AppTextStyle.textLMedium(AppColors.neutral900),
                        ),
                      ),
                      TextField(
                        obscureText: isObsecure,
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
                    ],
                  ),
                ),
              ),
              AppBtn(
                  btnText: 'Next',
                  btnColor: AppColors.primary500,
                  textColor: Colors.white,
                  onTap: () {
                    myCubit.checkPassword(passController.text);
                  })
            ],
          ),
        )),
      );
    });
  }
}
