import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/app_btn.dart';
import 'package:flutter_application_1/core/components/app_textfield.dart';
import 'package:flutter_application_1/core/components/my_appbar.dart';
import 'package:flutter_application_1/core/components/phone_textfield.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/core/utils/local_storage_helper.dart';
import 'package:flutter_application_1/core/utils/profile_model.dart';
import 'package:flutter_application_1/features/complete_profile/presentation/screens/complete_profile.dart';
import 'package:flutter_application_1/features/profile_setting/controller/profile_cubit.dart';
import 'package:flutter_application_1/features/profile_setting/controller/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class EditProfile extends StatefulWidget {
  bool? isCompleting;
  EditProfile({super.key, this.isCompleting});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var nameController = TextEditingController();

  var bioController = TextEditingController();

  var addressController = TextEditingController();

  var phoneController = TextEditingController();
  List<String> options = ['US.svg', 'google.svg', 'Facebook.svg'];
  String selectedOption = 'US.svg';
  ProfileModel? myProfile;

  @override
  void initState() {
    super.initState();
    myProfile = BlocProvider.of<ProfileCubit>(context).profileModel;
    nameController.text = myProfile != null ? myProfile!.name! : '';
    phoneController.text = widget.isCompleting != null
        ? ''
        : LocalStorageHelper.getStrings('phone') ?? '';
    addressController.text = widget.isCompleting != null
        ? ''
        : LocalStorageHelper.getStrings('address') ?? '';
    bioController.text = widget.isCompleting != null
        ? ''
        : LocalStorageHelper.getStrings('bio') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    var svgUrl = AppAssets.svgUrl;
    // var imgUrl = AppAssets.imageUrl;
    var myCubit = context.read<ProfileCubit>();

    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      if (state is EditProfileLoading || state is UploadImageLoading) {
        return const Scaffold(
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          MyAppBar(
                              title: widget.isCompleting != null
                                  ? 'Personal Details'
                                  : 'Edit profile',
                                  widget: widget.isCompleting!=null ? CompleteProfile() : null,
                                  ),
                        ],
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Center(
                        child: Stack(alignment: Alignment.center, children: [
                          CircleAvatar(
                            radius: 45.r,
                            backgroundImage: myCubit.img == null
                                ? null
                                : FileImage(myCubit.img!),
                          ),
                          Container(
                            width: 90
                                .w, // Adjust the width to cover the entire CircleAvatar
                            height: 90
                                .h, // Adjust the height to cover the entire CircleAvatar
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey
                                  .withOpacity(0.5), // Adjust the opacity here
                            ),
                          ),
                          SvgPicture.asset('${svgUrl}camera.svg')
                        ]),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              myCubit.pickImage();
                            });
                          },
                          child: Text(
                            'Change Photo',
                            style:
                                AppTextStyle.textLMedium(AppColors.primary500),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 32.h, bottom: 8.h),
                        child: Text(
                          'Name',
                          style: AppTextStyle.textLMedium(AppColors.neutral400),
                        ),
                      ),
                      AppTextField(
                          hintText: 'Enter Your Name',
                          prefixIcon: null,
                          controller: nameController),
                      Padding(
                        padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
                        child: Text(
                          'Bio',
                          style: AppTextStyle.textLMedium(AppColors.neutral400),
                        ),
                      ),
                      AppTextField(
                          hintText: 'Enter Your Bio',
                          prefixIcon: null,
                          controller: bioController),
                      Padding(
                        padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
                        child: Text(
                          'Address',
                          style: AppTextStyle.textLMedium(AppColors.neutral400),
                        ),
                      ),
                      AppTextField(
                          hintText: 'Enter Your Address',
                          prefixIcon: null,
                          controller: addressController),
                      Padding(
                        padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
                        child: Text(
                          'No. Handphone',
                          style: AppTextStyle.textLMedium(AppColors.neutral400),
                        ),
                      ),
                      PhoneTextfield(phoneController: phoneController)
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
                    onTap: () async {
                      if (widget.isCompleting != null) {
                        myCubit.setPersonalDetails(25);
                        print(LocalStorageHelper.getIntegers('progress'));
                      }
                      if (phoneController.text != '' &&
                          bioController.text != '' &&
                          addressController.text != '') {
                        myCubit.editProfile(
                            bio: bioController.text,
                            mobile: phoneController.text.replaceAll('-', ''),
                            address: addressController.text);
                        myCubit.updateName(nameController.text);
                        // Navigator.pop(context);
                      }
                    }),
              )
            ],
          ),
        )),
      );
    });
  }
}
