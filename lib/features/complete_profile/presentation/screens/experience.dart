import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/app_btn.dart';
import 'package:flutter_application_1/core/components/app_textfield.dart';
import 'package:flutter_application_1/core/components/my_appbar.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/complete_profile/presentation/screens/complete_profile.dart';
import 'package:flutter_application_1/features/complete_profile/presentation/widgets/basic_textfield.dart';
import 'package:flutter_application_1/features/complete_profile/presentation/widgets/combobox.dart';
import 'package:flutter_application_1/features/complete_profile/presentation/widgets/university_container.dart';
import 'package:flutter_application_1/features/profile_setting/controller/profile_cubit.dart';
import 'package:flutter_application_1/features/profile_setting/controller/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class Experience extends StatefulWidget {
  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  DateTime selectedStartDate = DateTime.now();
  var startDateController = TextEditingController();
  var locationController = TextEditingController();
  var positionController = TextEditingController();
  var typeWorkController = TextEditingController();
  var companyController = TextEditingController();
  bool isCurrent = false;
  List<String> uniqueDropdownItems = ['FullTime', 'PartTime', 'Item 3'];

  var svgUrl = AppAssets.svgUrl;

  List<UniversityContainer> universityWidget = [];
  int extractYear(String date) {
    return DateTime.parse(date).year;
  }

  Widget label(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h, top: 16.h),
      child: Text(
        label,
        style: AppTextStyle.textLMedium(AppColors.neutral400),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, DateTime selectedDate,
      TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        controller.text = DateFormat('dd MMMM yyyy').format(selectedDate);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    typeWorkController.text =
        uniqueDropdownItems[0]; // Set it to the first item, or any default item
  }

  @override
  Widget build(BuildContext context) {
    var myCubit = context.read<ProfileCubit>();
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      if (state is EditProfileLoading) {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MyAppBar(title: 'Experience',
                  widget: CompleteProfile(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(12.w, 0.h, 12.w, 16.h),
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 1.w, color: AppColors.neutral300),
                        borderRadius: BorderRadius.all(Radius.circular(12.r)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          label('Position*'),
                          BasicTextField(controller: positionController),
                          label('Type of work'),
                          ComboBox(
                            controller: typeWorkController,
                            dropdownItems: uniqueDropdownItems,
                          ),
                          label('Company name*'),
                          BasicTextField(controller: companyController),
                          label('Location'),
                          AppTextField(
                              hintText: '',
                              prefixIcon: 'location.svg',
                              controller: locationController),
                          Row(
                            children: [
                              Checkbox(
                                value: isCurrent,
                                activeColor: AppColors.primary500,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isCurrent = value!;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                'I am currently working in this role',
                                style: AppTextStyle.textMMedium(
                                    AppColors.neutral900),
                              ),
                              // Add additional widgets here if needed
                            ],
                          ),
                          label('Start Year'),
                          BasicTextField(
                            controller: startDateController,
                            isDate: true,
                            onTap: () {
                              _selectDate(context, selectedStartDate,
                                  startDateController);
                            },
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          AppBtn(
                            btnText: 'Save',
                            btnColor: AppColors.primary500,
                            textColor: Colors.white,
                            onTap: () {
                              setState(() {
                                myCubit.setPersonalDetails(75);
                                universityWidget.add(UniversityContainer(
                                  universityName: positionController.text,
                                  degree:
                                      '${typeWorkController.text} • ${companyController.text}',
                                  startDate:
                                      startDateController.text.split(' ').last,
                                  endDate: isCurrent ? 'Present' : '',
                                ));
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  for (int i = 0; i < universityWidget.length; i++)
                    Column(
                      children: [
                        universityWidget[i],
                        SizedBox(height: 16.h),
                      ],
                    )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
