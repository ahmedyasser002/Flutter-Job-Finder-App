import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/app_btn.dart';
import 'package:flutter_application_1/core/components/my_appbar.dart';
// import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/utils/local_storage_helper.dart';
import 'package:flutter_application_1/features/profile_setting/presentation/screens/two_step_three.dart';
import 'package:flutter_application_1/features/profile_setting/presentation/widgets/activate_two_step.dart';
import 'package:flutter_application_1/features/profile_setting/presentation/widgets/two_step_inst.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
// import 'package:flutter_application_1/core/style/app_text_style.dart';
// import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class TwoStepOne extends StatefulWidget {
  final Function(bool) onTwoStepChanged;
  const TwoStepOne({super.key, required this.onTwoStepChanged});

  @override
  State<TwoStepOne> createState() => _TwoStepOneState();
}

class _TwoStepOneState extends State<TwoStepOne> {
  bool isTwoStepActivated = false;

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
                  children: [
                    MyAppBar(title: 'Two-step verification'),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 28.h),
                      child: ActivateTwoStep(
                        onSwitchChanged: (value) {
                          isTwoStepActivated = value;
                        },
                      ),
                    ),
                    TwoStepInst(
                        icon: 'blueLock.svg',
                        inst:
                            'Two-step verification provides additional\nsecurity by asking for a verification code\nevery time you log in on another device.'),
                    TwoStepInst(
                        icon: 'external-drive.svg',
                        inst:
                            'Two-step verification provides additional\nsecurity by asking for a verification code\nevery time you log in on another device.')
                  ],
                ),
              ),
            ),
            AppBtn(
                btnText: 'Next',
                btnColor: AppColors.primary500,
                textColor: Colors.white,
                onTap: () {
                  if (isTwoStepActivated) {
                    setState(() {
                      LocalStorageHelper.setBool('twoStep', true);
                    });
                  } else {
                    setState(() {
                      LocalStorageHelper.setBool('twoStep', false);
                    });
                  }
                  widget.onTwoStepChanged(isTwoStepActivated);
                  if (isTwoStepActivated) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TwoStepThree()));
                  } else {
                    Navigator.pop(context);
                  }
                })
          ],
        ),
      )),
    );
  }
}
