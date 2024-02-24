import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivateTwoStep extends StatefulWidget {
    final ValueChanged<bool> onSwitchChanged;
      const ActivateTwoStep({Key? key, required this.onSwitchChanged}) : super(key: key);


  @override
  State<ActivateTwoStep> createState() => _ActivateTwoStepState();
}

class _ActivateTwoStepState extends State<ActivateTwoStep> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 14.w),
      decoration: BoxDecoration(
          border: Border.all(width: 1.w, color: AppColors.neutral300),
          borderRadius: BorderRadius.all(Radius.circular(8.r))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Secure your account with\ntwo-step verification',
            style: AppTextStyle.textLMedium(AppColors.neutral500),
          ),
          CupertinoSwitch(
            activeColor: AppColors.primary500,
            trackColor: AppColors.neutral300,
            value: switchValue,
            onChanged: (value) {
              setState(() {
                switchValue = value;
              });
              widget.onSwitchChanged(value); // Callback to the parent with the updated value

            },
          ),
        ],
      ),
    );
  }
}
