import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/applied/controller/applied_cubit.dart';
import 'package:flutter_application_1/features/applied/controller/applied_state.dart';
import 'package:flutter_application_1/features/applied/presentation/widgets/applied_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Active extends StatelessWidget {
  Active({super.key});
  @override
  Widget build(BuildContext context) {
    var myCubit = context.read<AppliedCubit>();
    return BlocBuilder<AppliedCubit, AppliedState>(builder: (context, state) {
      if (state is AppliedStateLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 22.h, bottom: 24.h),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.neutral200,
                  border: Border.all(width: 1.w, color: AppColors.neutral100)),
              child: Text(
                '${myCubit.appliedJobs.length} Jobs',
                style: AppTextStyle.textMMedium(AppColors.neutral500),
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: ((context, index) {
                    return AppliedContainer(
                        appliedModel: myCubit.appliedJobs[index]);
                  }),
                  separatorBuilder: ((context, index) {
                    return SizedBox(
                      height: 16.h,
                    );
                  }),
                  itemCount: myCubit.appliedJobs.length))
        ],
      );
    });
  }
}
