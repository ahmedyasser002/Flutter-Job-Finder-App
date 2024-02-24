import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/app_btn.dart';
import 'package:flutter_application_1/core/components/my_appbar.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/core/components/app_textfield.dart';
import 'package:flutter_application_1/core/utils/validate.dart';
import 'package:flutter_application_1/features/apply_job/presentation/screens/type_of_work.dart';
import 'package:flutter_application_1/features/apply_job/presentation/widgets/input_label.dart';
import 'package:flutter_application_1/features/apply_job/presentation/widgets/progress_container.dart';
import 'package:flutter_application_1/features/homescreen/data/data_models/suggested_job_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class ApplyJob extends StatefulWidget {
  SuggestedJobModel jobModel;
  bool? isApplied;
  ApplyJob({super.key, required this.jobModel, this.isApplied});

  @override
  State<ApplyJob> createState() => _ApplyJobState();
}

class _ApplyJobState extends State<ApplyJob> {
  List<String> options = ['US.svg', 'google.svg', 'Facebook.svg'];
  String selectedOption = 'US.svg';
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var svgUrl = AppAssets.svgUrl;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 24.h, right: 24.w, left: 24.w),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.isApplied != null
                          ? Column(
                              children: [
                                MyAppBar(title: 'Applied      '),
                                Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 48,
                                        height: 48,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.r)),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.r)),
                                          child: Image.network(
                                            '${widget.jobModel.imageUrl}',
                                            width: 48,
                                            height: 48,
                                            // fit: BoxFit.cover, // You can adjust the BoxFit property as needed
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 6.h),
                                        child: Text(
                                          widget.jobModel.jobName!,
                                          style: AppTextStyle.headingFourMedium(
                                              AppColors.neutral900),
                                        ),
                                      ),
                                      Text(
                                        '${widget.jobModel.compName} • ${widget.jobModel.location!.split(',')[widget.jobModel.location!.split(',').length - 2].trim()},  ${widget.jobModel.location!.split(',').last.trim()}',
                                        style: AppTextStyle.textSRegular(
                                            AppColors.neutral700),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : MyAppBar(title: 'Apply Job'),
                      // Row(
                      //   children: [
                      //     InkWell(
                      //         onTap: () {
                      //           Navigator.pop(context);
                      //         },
                      //         child:
                      //             SvgPicture.asset('${svgUrl}arrow_left.svg')),
                      //     Expanded(
                      //       child: Align(
                      //         alignment: Alignment.center,
                      //         child: Text(
                      //           'Apply Job     ',
                      //           style: AppTextStyle.headingFourMedium(
                      //               AppColors.neutral900),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              SvgPicture.asset('${svgUrl}Vector.svg'),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                'Biodata',
                                style: AppTextStyle.textSRegular(
                                    AppColors.primary500),
                              )
                            ],
                          ),
                          SvgPicture.asset('${svgUrl}Line.svg'),
                          Column(
                            children: [
                              ProgressContainer(isTurn: false, stepNo: '2'),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                'Type of work',
                                style: AppTextStyle.textSRegular(
                                    AppColors.neutral900),
                              )
                            ],
                          ),
                          SvgPicture.asset('${svgUrl}Line.svg'),
                          Column(
                            children: [
                              ProgressContainer(isTurn: false, stepNo: '3'),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                'Upload Portfolio',
                                style: AppTextStyle.textSRegular(
                                    AppColors.neutral900),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'Biodata',
                        style: AppTextStyle.headingFourMedium(
                            AppColors.neutral900),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.h, bottom: 24.h),
                        child: Text(
                          'Fill in your bio data correctly',
                          style:
                              AppTextStyle.textMRegular(AppColors.neutral500),
                        ),
                      ),
                      InputLabel(label: 'Full Name'),
                      SizedBox(
                        height: 8.h,
                      ),
                      AppTextField(
                        hintText: 'Enter Your Name',
                        prefixIcon: 'profile.svg',
                        controller: nameController,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.h, top: 18.h),
                        child: InputLabel(label: 'Email'),
                      ),
                      AppTextField(
                        hintText: 'Enter Your Email',
                        prefixIcon: 'sms.svg',
                        controller: emailController,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.h, top: 18.h),
                        child: InputLabel(label: 'No.Handphone'),
                      ),
                      Container(
                        height: 56.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.neutral300, width: 1.w),
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
                                          child: SvgPicture.asset(
                                              '$svgUrl$option'),
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
                              color: AppColors
                                  .neutral200, // Color of the horizontal line
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Expanded(
                              child: SizedBox(
                                child: TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      if (value.replaceAll('-', '').length %
                                              3 ==
                                          0) {
                                        phoneController.text += "-";
                                      }
                                      if (value.replaceAll('-', '').isEmpty) {
                                        phoneController.text = '';
                                      }
                                    });
                                  },
                                  controller: phoneController,
                                  decoration: InputDecoration(
                                    hintText: 'Enter Your Phone',
                                    hintStyle: AppTextStyle.textMRegular(
                                        AppColors.neutral400),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 22.h),
                child: AppBtn(
                  btnText: 'Next',
                  btnColor: AppColors.primary500,
                  textColor: Colors.white,
                  onTap: () {
                    Map<String, dynamic> inputFields = {
                      'name': nameController.text,
                      'email': emailController.text,
                      'mobile': phoneController.text,
                      'jobs_id': widget.jobModel.jobID,
                      'work_type': widget.jobModel.jobTimeType!,
                    };
                    if (Validate.validateName(nameController.text) &&
                       Validate.validateEmail(emailController.text) &&
                        Validate.validatePhone(phoneController.text.replaceAll('-', ''))) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TypeOfWork(
                                    inputFields: inputFields,
                                    
                                    jobModel: widget.isApplied!=null? widget.jobModel : null,
                                  )));
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
