import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/app_btn.dart';
import 'package:flutter_application_1/core/components/my_appbar.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/apply_job/controller/apply_cubit.dart';
import 'package:flutter_application_1/features/apply_job/controller/apply_state.dart';
import 'package:flutter_application_1/features/apply_job/presentation/screens/done_applying.dart';
import 'package:flutter_application_1/features/apply_job/presentation/widgets/cv_container.dart';
import 'package:flutter_application_1/features/apply_job/presentation/widgets/progress_container.dart';
import 'package:flutter_application_1/features/apply_job/presentation/widgets/upload_other_file.dart';
import 'package:flutter_application_1/features/homescreen/data/data_models/suggested_job_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class UploadPortfolio extends StatefulWidget {
  Map<String, dynamic> inputFields;
  SuggestedJobModel? jobModel;
  UploadPortfolio({super.key, required this.inputFields , this.jobModel});

  @override
  State<UploadPortfolio> createState() => _UploadPortfolioState();
}

class _UploadPortfolioState extends State<UploadPortfolio> {
  String? fileName;
  int? fileSize;
  String? otherFileName;
  int? otherFileSize;
  File? cvFile;
  File? otherFile;

  Future<void> pickFile(String contType) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!); // Use File directly
      if (contType == 'cv') {
        setState(() {
          cvFile = file;
          fileName =
              file.path.split('/').last; // Get the file name from the path
          fileSize = file.lengthSync();
        });
      } else {
        setState(() {
          otherFile = file;
          otherFileName =
              file.path.split('/').last; // Get the file name from the path
          otherFileSize = file.lengthSync();
        });
      }

      // Access the file name

      // Do something with the file name, for example, update your CVContainer
      // You can pass the 'fileName' to your CVContainer or perform any other logic
      // based on the selected file name.
      print('Selected file name: $fileName');
    } else {
      // User canceled the file picking
      print('File picking canceled');
    }
  }

  @override
  Widget build(BuildContext context) {
    var svgUrl = AppAssets.svgUrl;
    var myCubit = context.read<ApplyCubit>();

    return BlocConsumer<ApplyCubit, ApplyState>(listener: (context, state) {
      if (state is ApplyStateSuccess) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DoneApplying()));
      }
    }, builder: (context, state) {
      if (state is ApplyStateLoading) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      return Scaffold(
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 22.h),
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
                              SvgPicture.asset('${svgUrl}Vector.svg'),
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
                          SvgPicture.asset('${svgUrl}blueLine.svg'),
                          Column(
                            children: [
                              ProgressContainer(isTurn: true, stepNo: '3'),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                'Upload Portfolio',
                                style: AppTextStyle.textSRegular(
                                    AppColors.primary500),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'Upload portfolio',
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
                      Row(
                        children: [
                          Text(
                            'Upload CV',
                            style:
                                AppTextStyle.textLMedium(AppColors.neutral900),
                          ),
                          Text(
                            '*',
                            style:
                                AppTextStyle.textLMedium(AppColors.danger500),
                          )
                        ],
                      ),
                      CVContainer(
                          onCancel: () {
                            setState(() {
                              fileName = null;
                            });
                          },
                          fileName: fileName,
                          onTap: () {
                            setState(() {
                              pickFile('cv');
                            });
                          },
                          fileSize: fileSize),
                      SizedBox(height: 16.h),
                      otherFileName == null
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  pickFile('other');
                                });
                              },
                              child: UploadOtherFile())
                          : CVContainer(
                              onCancel: () {
                                setState(() {
                                  otherFileName = null;
                                });
                              },
                              fileName: otherFileName,
                              onTap: () {},
                              fileSize: otherFileSize)
                    ],
                  ),
                ),
              ),
              AppBtn(
                  btnText: 'Submit',
                  btnColor: AppColors.primary500,
                  textColor: Colors.white,
                  onTap: () {
                    myCubit.applyJob(
                        name: widget.inputFields['name'],
                        email: widget.inputFields['email'],
                        mobile: widget.inputFields['mobile'],
                        workType: 'full',
                        otherFile: otherFile,
                        cvFile: cvFile,
                        jobID: widget.inputFields['jobs_id']);
                  })
            ],
          ),
        )),
      );
    });
  }
}
