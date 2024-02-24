import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart'; // Import Cupertino library

class NotifySetting extends StatefulWidget {
  final String notifySettingText;

  const NotifySetting({Key? key, required this.notifySettingText}) : super(key: key);

  @override
  _NotifySettingState createState() => _NotifySettingState();
}

class _NotifySettingState extends State<NotifySetting> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 24.w, left: 24.w, top: 6.h),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18.h),
        decoration: BoxDecoration(
            border: Border(
                bottom:
                    BorderSide(width: 1.w, color: AppColors.neutral200))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.notifySettingText,
              style: AppTextStyle.textLRegular(AppColors.neutral900),
            ),
            CupertinoSwitch(
              activeColor: AppColors.primary500,
              trackColor: AppColors.neutral300,
              value: switchValue,
              onChanged: (value) {
                setState(() {
                  switchValue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

