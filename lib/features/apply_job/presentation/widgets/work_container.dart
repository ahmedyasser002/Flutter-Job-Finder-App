import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class WorkContainer extends StatefulWidget {
  final ValueChanged<String> onContainerSelected;
  String jobType;
  String value;
  final String groupValue;

  WorkContainer(
      {super.key,
      required this.onContainerSelected,
      required this.jobType,
      required this.value,
      required this.groupValue});

  @override
  State<WorkContainer> createState() => _WorkContainerState();
}

class _WorkContainerState extends State<WorkContainer> {
  bool isSelected = false;
  String groupVal = "option1";
  @override
  Widget build(BuildContext context) {
        bool isSelected = widget.value == widget.groupValue;

    var svgUrl = AppAssets.svgUrl;
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
        color: isSelected ? AppColors.primary100 : Colors.white,
            border: Border.all(width: 1.w, color: isSelected ? AppColors.primary500 : AppColors.neutral300),
            borderRadius: BorderRadius.all(Radius.circular(8.r))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.jobType,
                  style: AppTextStyle.textLMedium(AppColors.neutral900),
                ),
                Row(
                  children: [
                    Text(
                      'CV.pdf',
                      style: AppTextStyle.textMMedium(AppColors.neutral500),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: SvgPicture.asset('${svgUrl}point.svg'),
                    ),
                    Text(
                      'Portfolio.pdf',
                      style: AppTextStyle.textMMedium(AppColors.neutral500),
                    )
                  ],
                ),
              ],
            ),
            Radio(
              value: widget.value,
              groupValue: widget.groupValue,
              onChanged: (value) {
                widget.onContainerSelected(value.toString());
                // setState(() {
                //   isSelected = !isSelected;
                // });
              },
            ),
          ],
        ),
      ),
    );
  }
}
