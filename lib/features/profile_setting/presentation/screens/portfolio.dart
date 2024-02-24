import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/my_appbar.dart';
import 'package:flutter_application_1/features/apply_job/presentation/widgets/cv_container.dart';
import 'package:flutter_application_1/features/apply_job/presentation/widgets/upload_other_file.dart';
import 'package:flutter_application_1/features/complete_profile/presentation/screens/complete_profile.dart';
import 'package:flutter_application_1/features/profile_setting/controller/profile_cubit.dart';
import 'package:flutter_application_1/features/profile_setting/controller/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Portfolio extends StatefulWidget {
  bool? isCompleting;
  Portfolio({super.key , this.isCompleting});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  String? fileName;
  int? fileSize;
  File? cvFile;
  // List<CVContainer> cvContainers = [];

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!); // Use File directly
      setState(() {
        cvFile = file;
        fileName = file.path.split('/').last; // Get the file name from the path
        fileSize = file.lengthSync();
      });

      print('Selected file name: $fileName');
    } else {
      // User canceled the file picking
      print('File picking canceled');
    }
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileCubit>(context).getPortfolio();
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
        child: Column(
          children: [
            MyAppBar(title: 'Portfolio',
            widget: widget.isCompleting!=null ? CompleteProfile() : null,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: InkWell(
                  onTap: () async {
                    await pickFile();
                    myCubit.addPortfolio(cvFile!);
                    myCubit.setPersonalDetails(100);
                    // cvContainers.add(CVContainer(
                    //     fileName: fileName,
                    //     onTap: () {},
                    //     fileSize: fileSize,
                    //     onCancel: () {}));
                  },
                  child: UploadOtherFile()),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return CVContainer(
                      fileName: myCubit.portfolios[index].cvFile,
                      onTap: () {},
                      fileSize: 123,
                      onCancel: () {
                        setState(() {
                          myCubit.portfolios.remove(myCubit.portfolios[index]);
                        });
                      });
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 16.h,
                  );
                },
                itemCount: myCubit.portfolios.length,
              ),
            )
          ],
        ),
      )));
    });
  }
}
