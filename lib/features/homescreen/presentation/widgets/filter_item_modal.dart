import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/app_btn.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/homescreen/presentation/widgets/filter_jobtype_container_modal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class FilterItem extends StatefulWidget {
  var jobNameController = TextEditingController();
  var locationController = TextEditingController();
  void Function(String salaryRange) onFilterPress;
  FilterItem(
      {super.key,
      required this.jobNameController,
      required this.locationController,
      required this.onFilterPress});

  @override
  State<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  String selectedOption = '\$15K - \$20K';
  List<String> options = [
    '\$5K - \$10K',
    '\$10K - \$15K',
    '\$15K - \$20K',
    '\$20K - \$25K',
    '\$25K - \$30K'
  ];
  var svgUrl = AppAssets.svgUrl;
  var imgUrl = AppAssets.imageUrl;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double containerHeight = 0.94 * screenHeight; // 20% of screen height
    return SingleChildScrollView(
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children:[ Container(
          // height: 758.h,
          height: containerHeight,
          padding: EdgeInsets.fromLTRB(24.w, 40.h, 24.w, 40.h),
          decoration: const BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('${svgUrl}arrow_left.svg'),
                  Text(
                    'Set Filter',
                    style: AppTextStyle.headingFourMedium(AppColors.neutral900),
                  ),
                  Text(
                    'Reset',
                    style: AppTextStyle.textLMedium(AppColors.primary500),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 28.h, bottom: 8.h),
                child: Text(
                  'Job Tittle',
                  style: AppTextStyle.textLMedium(AppColors.neutral900),
                ),
              ),
              SizedBox(
                height: 56,
                child: TextField(
                  controller: widget.jobNameController,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Image.asset('${imgUrl}black-briefcase.png'),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        borderSide:
                            BorderSide(color: AppColors.neutral300, width: 1.w)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        borderSide:
                            BorderSide(color: AppColors.neutral300, width: 1.w)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
                child: Text(
                  'Location',
                  style: AppTextStyle.textLMedium(AppColors.neutral900),
                ),
              ),
              SizedBox(
                height: 56,
                child: TextField(
                  controller: widget.locationController,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Image.asset('${imgUrl}location.png'),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        borderSide:
                            BorderSide(color: AppColors.neutral300, width: 1.w)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        borderSide:
                            BorderSide(color: AppColors.neutral300, width: 1.w)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
                child: Text(
                  'Salary',
                  style: AppTextStyle.textLMedium(AppColors.neutral900),
                ),
              ),
              SizedBox(
                  height: 56,
                  // constraints: BoxConstraints(),
                  child: InputDecorator(
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Image.asset('${imgUrl}dollar-circle.png'),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide:
                              BorderSide(color: AppColors.neutral300, width: 1.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide:
                              BorderSide(color: AppColors.neutral300, width: 1.0),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
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
                            child: Text(option),
                          );
                        }).toList(),
                      ),
                      ),
                      )),
              Padding(
                padding: EdgeInsets.only(top: 16.h, bottom: 12.h),
                child: Text(
                  'Job Type',
                  style: AppTextStyle.textLMedium(AppColors.neutral900),
                ),
              ),
              Row(
                children: [
                  FilterJobTypeContainer(
                    jobType: 'Full Time',
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: FilterJobTypeContainer(jobType: 'Remote'),
                  ),
                  FilterJobTypeContainer(
                    jobType: 'Contract',
                  )
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  FilterJobTypeContainer(
                    jobType: 'Part Time',
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: FilterJobTypeContainer(jobType: 'Onsite'),
                  ),
                  FilterJobTypeContainer(
                    jobType: 'Internship',
                  )
                ],
              ),
              SizedBox(
                height: 158.h,
              ),
             
            ],
          ),
        ),
        Positioned( bottom: 25,

          child: AppBtn(
                  btnText: 'Show result',
                  btnColor: AppColors.primary500,
                  textColor: const Color(0xFFFFFFFF),
                  onTap:(){
                        widget.onFilterPress(selectedOption);
          
                  } ,
                  ) )
      ],
      
      
      ),
    );
  }
}
