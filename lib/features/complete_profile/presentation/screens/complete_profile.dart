import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/my_appbar.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/core/utils/local_storage_helper.dart';
import 'package:flutter_application_1/features/complete_profile/presentation/screens/education.dart';
import 'package:flutter_application_1/features/complete_profile/presentation/screens/experience.dart';
import 'package:flutter_application_1/features/complete_profile/presentation/widgets/complete_container.dart';
import 'package:flutter_application_1/features/profile_setting/presentation/screens/edit_profile.dart';
import 'package:flutter_application_1/features/profile_setting/presentation/screens/portfolio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ... (your imports)

class CompleteProfile extends StatefulWidget {
  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  // Track progress in the state
  int _progress = 0;

  @override
  void initState() {
    super.initState();
    // Initialize progress in the state with the value from LocalStorageHelper
    _progress = LocalStorageHelper.getIntegers('progress') ?? 0;
  }

  // Update progress and rebuild the widget
  void _updateProgress() {
    setState(() {
      _progress = LocalStorageHelper.getIntegers('progress') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                MyAppBar(title: 'Complete Profile'),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        
                        width: 100.0,
                        height: 100.0,
                        child: CircularProgressIndicator(
                          strokeWidth: 7,
                          value:
                              (LocalStorageHelper.getIntegers('progress') ?? 0) /
                                  100.0,
                          backgroundColor: Colors.grey,
                          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary500),
                        ),
                      ),
                      Text('$_progress%' , style: AppTextStyle.headingThreeMedium(AppColors.primary500),),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 18.h,bottom: 12.h),
                  child: Text('${(_progress / 25).toInt()}/4 Completed' , style: AppTextStyle.textLMedium(AppColors.primary500),),
                ),
                Text('Complete your profile before applying for a job' , style: AppTextStyle.textLRegular(AppColors.neutral500),),
                SizedBox(height: 16.h,),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfile(isCompleting: true),
                      ),
                    );
                  },
                  child: CompleteContainer(
                    containerText: 'Personal Details',
                    containerDesc: 'Full name, email, phone number, and your\naddress',
                    containerColor:
                        _progress >= 25 ? AppColors.primary300 : Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Education()),
                    );
                  },
                  child: CompleteContainer(
                    containerText: 'Education',
                    containerDesc: 'Full name, email, phone number, and your\naddress',
                    containerColor:
                        _progress >= 50 ? AppColors.primary300 : Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {
                     Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Experience()),
                    
                    );
                  },
                  child: CompleteContainer(
                    containerText: 'Experience',
                    containerDesc:'Enter your work experience to be\nconsidered by the recruiter' ,
                    containerColor:
                        _progress >= 75 ? AppColors.primary300 : Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {
                     Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Portfolio(isCompleting: true,)),
                    );
                  },
                  child: CompleteContainer(
                    isLast: true,
                    containerText: 'Portfolio',
                    containerDesc: 'Create your portfolio. Applying for various\ntypes of jobs is easier.',
                    containerColor:
                        _progress >= 100 ? AppColors.primary300 : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
