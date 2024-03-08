import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/app_btn.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/bottom_bar/screens/bottom_bar.dart';
// import 'package:flutter_application_1/features/saved_notifications/controller/saved_cubit.dart';
import 'package:flutter_application_1/features/sign_in/controller/login_cubit.dart';
import 'package:flutter_application_1/features/sign_in/controller/login_state.dart';
import 'package:flutter_application_1/features/sign_in/presentation/screens/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class AccSetup extends StatelessWidget {
  String svgUrl = AppAssets.svgUrl;
  String imgUrl = AppAssets.imageUrl;
  String email, password;

  AccSetup({super.key, required this.email, required this.password});
  @override
  Widget build(BuildContext context) {
    // var myCubit = context.read<LoginCubit>();
    return BlocBuilder<LoginCubit, LoggingState>(builder: (context, state) {
      if (state is LoginLoadingState) {
        return Scaffold(
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
          padding: EdgeInsets.only(top: 60.h, right: 24.w, left: 24.w),
          child: SafeArea(
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
                  padding: EdgeInsets.only(top: 97.h, bottom: 24.h),
                  child: Center(
                    child: Image.asset('${imgUrl}success_acc_reg.png'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Center(
                    child: Text(
                      'Your account has been set up!',
                      style:
                          AppTextStyle.headingThreeMedium(AppColors.neutral900),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'We have customized feeds according to your',
                    style: AppTextStyle.textMRegular(AppColors.neutral500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 295.h),
                  child: Center(
                    child: Text(
                      'preferences',
                      style: AppTextStyle.textMRegular(AppColors.neutral500),
                    ),
                  ),
                ),
                AppBtn(
                    btnText: 'Get Started',
                    btnColor: AppColors.primary500,
                    textColor: const Color(0xFFFFFFFF),
                    onTap: () {
                      // context.read<SavedCubit>().getSavedJobs();
                      
                      // context.read<LoginCubit>().loginUser(email, password);
                      // myCubit.loginUser(email, password);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    })
              ],
            ),
          )),
        ),
      );
    });
  }
}
