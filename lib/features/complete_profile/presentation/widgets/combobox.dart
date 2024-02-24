import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ComboBox extends StatelessWidget {
  var controller = TextEditingController();
    List<String> dropdownItems; // Define the dropdownItems list here

  ComboBox({super.key , required this.controller , required this.dropdownItems});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
              value: controller.text,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  borderSide: BorderSide(color: AppColors.neutral300, width: 1.w),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  borderSide: BorderSide(color: AppColors.neutral300, width: 1.w),
                ),
              ),
              items: dropdownItems
                  .map((String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (String? newValue) {
                // Do something with the selected value if needed
                if (newValue != null) {
                  controller.text = newValue;
                }
              },
            ) ;
  }
}
