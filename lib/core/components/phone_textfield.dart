import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class PhoneTextfield extends StatefulWidget {
  var phoneController = TextEditingController();
  PhoneTextfield({super.key , required this.phoneController});

  @override
  State<PhoneTextfield> createState() => _PhoneTextfieldState();
}

class _PhoneTextfieldState extends State<PhoneTextfield> {
  List<String> options = ['US.svg', 'google.svg', 'Facebook.svg'];
  String selectedOption = 'US.svg';
  @override
  Widget build(BuildContext context) {
    var svgUrl = AppAssets.svgUrl;
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.neutral300, width: 1.w),
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            child: Row(
              children: [
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedOption,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedOption = newValue!;
                      });
                    },
                    items: options.map((String option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: SvgPicture.asset('$svgUrl$option'),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(width: 8.w),
                // Add combo box functionality here
                // This can be a DropdownButton or any other widget
              ],
            ),
          ),
          Container(
            height: 24.h, // Adjust the height as needed
            width: 1.w,
            color: AppColors.neutral200, // Color of the horizontal line
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            child: SizedBox(
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    if (value.replaceAll('-', '').length % 3 == 0) {
                      widget.phoneController.text += "-";
                    }
                    if (value.replaceAll('-', '').isEmpty) {
                      widget.phoneController.text = '';
                    }
                  });
                },
                controller: widget.phoneController,
                decoration: InputDecoration(
                  hintText: 'Enter Your Phone',
                  hintStyle: AppTextStyle.textMRegular(AppColors.neutral400),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
