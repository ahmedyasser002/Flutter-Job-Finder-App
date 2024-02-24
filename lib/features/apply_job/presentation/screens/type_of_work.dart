import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/app_btn.dart';
import 'package:flutter_application_1/core/components/my_appbar.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/apply_job/presentation/screens/upload_portfolio.dart';
import 'package:flutter_application_1/features/apply_job/presentation/widgets/progress_container.dart';
import 'package:flutter_application_1/features/apply_job/presentation/widgets/work_container.dart';
import 'package:flutter_application_1/features/homescreen/data/data_models/suggested_job_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class TypeOfWork extends StatefulWidget {
  Map<String, dynamic> inputFields;
  SuggestedJobModel? jobModel;
  TypeOfWork({super.key, required this.inputFields , this.jobModel});

  @override
  State<TypeOfWork> createState() => _TypeOfWorkState();
}

class _TypeOfWorkState extends State<TypeOfWork> {
  List<String> options = ['US.svg', 'google.svg', 'Facebook.svg'];
  String selectedOption = 'US.svg';
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  String groupVal = '';

  @override
  Widget build(BuildContext context) {
    var svgUrl = AppAssets.svgUrl;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 16.h, right: 24.w, left: 24.w),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.jobModel != null
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
                                            '${widget.jobModel!.imageUrl}',
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
                                          widget.jobModel!.jobName!,
                                          style: AppTextStyle.headingFourMedium(
                                              AppColors.neutral900),
                                        ),
                                      ),
                                      Text(
                                        '${widget.jobModel!.compName} • ${widget.jobModel!.location!.split(',')[widget.jobModel!.location!.split(',').length - 2].trim()},  ${widget.jobModel!.location!.split(',').last.trim()}',
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
                          SvgPicture.asset('${svgUrl}blueLine.svg'),
                          Column(
                            children: [
                              ProgressContainer(isTurn: true, stepNo: '2'),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                'Type of work',
                                style: AppTextStyle.textSRegular(
                                    AppColors.primary500),
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
                        'Type of work',
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
                      WorkContainer(
                        onContainerSelected: (selectedValue) {
                          setState(() {
                            groupVal = selectedValue;
                          });
                        },
                        jobType: 'Senior UX Designer',
                        value: 'option1',
                        groupValue: groupVal,
                      ),
                      WorkContainer(
                        onContainerSelected: (selectedValue) {
                          setState(() {
                            groupVal = selectedValue;
                          });
                        },
                        jobType: 'Senior UI Designer',
                        value: 'option2',
                        groupValue: groupVal,
                      ),
                      WorkContainer(
                        onContainerSelected: (selectedValue) {
                          setState(() {
                            groupVal = selectedValue;
                          });
                        },
                        jobType: 'Graphik Designer',
                        value: 'option3',
                        groupValue: groupVal,
                      ),
                      WorkContainer(
                        onContainerSelected: (selectedValue) {
                          setState(() {
                            groupVal = selectedValue;
                          });
                        },
                        jobType: 'Front-End Developer',
                        value: 'option4',
                        groupValue: groupVal,
                      ),
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
                    if (groupVal!='') {
                      
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UploadPortfolio(
                                  inputFields: widget.inputFields,
                                  jobModel: widget.jobModel!=null ? widget.jobModel : null,
                                )));
                    }
                    // Map<String, String> inputFields = {
                    //   'name': nameController.text,
                    //   'email': emailController.text,
                    //   'phone': phoneController.text,
                    // };
                    // if (nameController.text.isNotEmpty &&
                    //     emailController.text.isNotEmpty &&
                    //     phoneController.text.isNotEmpty) {}
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>));
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
