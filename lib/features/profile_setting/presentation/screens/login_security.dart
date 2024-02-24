import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/my_appbar.dart';
// import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/core/utils/local_storage_helper.dart';
import 'package:flutter_application_1/features/profile_setting/controller/profile_cubit.dart';
import 'package:flutter_application_1/features/profile_setting/controller/profile_state.dart';
import 'package:flutter_application_1/features/profile_setting/presentation/screens/change_password.dart';
import 'package:flutter_application_1/features/profile_setting/presentation/screens/main_email.dart';
import 'package:flutter_application_1/features/profile_setting/presentation/screens/main_phone.dart';
import 'package:flutter_application_1/features/profile_setting/presentation/screens/privacy_policy.dart';
import 'package:flutter_application_1/features/profile_setting/presentation/screens/two_step_one.dart';
import 'package:flutter_application_1/features/profile_setting/presentation/widgets/login_security_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

class LoginSecurity extends StatelessWidget {
  const LoginSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    // var svgUrl = AppAssets.svgUrl;
    var myCubit = context.read<ProfileCubit>();

    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      if (state is GetProfileDetailsLoading) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(24.w, 16.h, 34.w, 32.h),
                child: MyAppBar(title: 'Login and security'),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.neutral200,
                    border:
                        Border.all(width: 1.w, color: AppColors.neutral100)),
                child: Text(
                  'Account Access',
                  style: AppTextStyle.textMMedium(AppColors.neutral500),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              LoginSecurityContainer(
                option: 'Email Address',
                value: myCubit.profileModel?.email ?? '',
                widget: MainEmail(),
              ),
              LoginSecurityContainer(
                option: 'Phone number',
                widget: MainPhone(),
                value: LocalStorageHelper.getStrings('phone'),
              ),
              LoginSecurityContainer(
                option: 'Change passowrd',
                widget: const ChangePassword(),
              ),
              LoginSecurityContainer(
                option: 'Two-step verification',
                value: LocalStorageHelper.getBool('twoStep') == true
                    ? 'Active'
                    : 'Non Active',
                widget: TwoStepOne(
                  onTwoStepChanged: (value) {
                    myCubit.updateTwoStep(value);
                  },
                ),
              ),
              LoginSecurityContainer(
                option: 'Face ID',
                widget: const PrivacyPolicy(),
              ),
            ],
          ),
        )),
      );
    });
  }
}
