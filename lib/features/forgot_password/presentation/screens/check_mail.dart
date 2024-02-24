import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/app_btn.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/bottom_bar/screens/bottom_bar.dart';
import 'package:flutter_application_1/features/forgot_password/presentation/screens/new_pass.dart';
import 'package:flutter_application_1/features/sign_in/controller/login_cubit.dart';
import 'package:flutter_application_1/features/sign_in/controller/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class CheckMail extends StatelessWidget {
  String svgUrl = AppAssets.svgUrl;
  String imgUrl = AppAssets.imageUrl;

  CheckMail({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoggingState>(builder: (context, state) {
      if (state is LoginLoadingState) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else if (state is LoginSuccessState) {
        Navigator.push(
            context, (MaterialPageRoute(builder: (context) => BottomBar())));
      }
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 16.h, right: 24.w, left: 24.w,bottom:16.h),
          child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                              child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset('${svgUrl}arrow_left.svg')),
                      Padding(
                        padding: EdgeInsets.only(top: 141.h, bottom: 24.h),
                        child: Center(
                          child: Image.asset('${imgUrl}success_acc_reg.png'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: Center(
                          child: Text(
                            'Check your Email',
                            style:
                                AppTextStyle.headingThreeMedium(AppColors.neutral900),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'We have sent a reset password to your email address',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.textMRegular(AppColors.neutral500),
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(bottom: 295.h),
                      //   child:const SizedBox()
                      // ),
                    ],
                              ),
                            ),
                  ),
                      AppBtn(
                          btnText: 'Open email app',
                          btnColor: AppColors.primary500,
                          textColor: const Color(0xFFFFFFFF),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>const NewPass()));
                          })
                ],
              )),
        ),
      );
    });
  }
}
