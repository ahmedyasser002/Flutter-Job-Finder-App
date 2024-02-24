import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Description extends StatelessWidget {
  String jobDesc;
  String jobSkill;

  Description({super.key, required this.jobDesc, required this.jobSkill});

  @override
  Widget build(BuildContext context) {
    List<String> requirements = jobSkill.split('\n');
    jobDesc = jobDesc.replaceAll('\n', ', ');
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Job Description',
            style: AppTextStyle.textMMedium(AppColors.neutral900),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.h, bottom: 18.h),
            child: Text(
              jobDesc,
              style: AppTextStyle.textSRegular(AppColors.neutral600),
            ),
          ),
          Text(
            'Skill Required',
            style: AppTextStyle.textMMedium(AppColors.neutral900),
          ),
          SizedBox(
            height: 16.h,
          ),
          for (int index = 0; index < requirements.length; index++)
            Container(
                margin: EdgeInsets.only(bottom: 8.h),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      const Icon(
                        Icons.fiber_manual_record,
                        size: 8,
                        color: AppColors.neutral600,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          requirements[index],
                          style:
                              AppTextStyle.textSRegular(AppColors.neutral600),
                        ),
                      )
                    ]))

          // Expanded(
          //   child: ListView.separated(
          //     // shrinkWrap: true,
          //     // physics: NeverScrollableScrollPhysics(),
          //     itemCount: requirements.length,
          //     separatorBuilder: (BuildContext context, int index) {
          //       return SizedBox(height: 8.h);
          //     },
          //     itemBuilder: (BuildContext context, int index) {
          //       return Row(
          //         crossAxisAlignment: CrossAxisAlignment.baseline,
          //         textBaseline: TextBaseline.alphabetic,
          //         children: [
          //           const Icon(
          //             Icons.fiber_manual_record,
          //             size: 8,
          //             color: AppColors.neutral600,
          //           ),
          //           SizedBox(width: 8.w),
          //           Expanded(
          //             child: Text(
          //               requirements[index],
          //               style: AppTextStyle.textSRegular(AppColors.neutral600),
          //             ),
          //           ),
          //         ],
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}





// class Description extends StatelessWidget {
//   List<String> requirements = [
//     'A strong visual portfolio with clear understanding of UI methodologies',
//     'Ability to create hi-fidelity mock-ups in Figma',
//     'Ability to create various graphics for the web e.g. illustrations and icons',
//     'Able to facilitate workshops and liaise with stakeholders',
//     'Proficiency in the Adobe Creative Suite',
//     'Confident communicator with an analytical mindset',
//     'Design library/Design system experience',
//     '4+ years of commercial experience in UI/Visual Design'
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Job Description',
//             style: AppTextStyle.textMMedium(AppColors.neutral900),
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: 10.h, bottom: 18.h),
//             child: Text(
//               'Your role as the UI Designer is to use interactive components on various platforms (web, desktop and mobile). This will include producing high-fidelity mock-ups, iconography, UI illustrations/graphics, and other graphic elements. As the UI Designer, you will be supporting the wider design team with the internal Design System, tying together the visual language. You will with other UI and UX Designers, Product Managers, and Engineering teams in a highly customer-focused agile environment to help define the vision of the products.',
//               style: AppTextStyle.textSRegular(AppColors.neutral600),
//             ),
//           ),
//           Text(
//             'Skill Required',
//             style: AppTextStyle.textMMedium(AppColors.neutral900),
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: 10.h, bottom: 18.h),
//             child: Column(
//               children: [
//                 ListTile(
//                   title: Row(
//                     crossAxisAlignment: CrossAxisAlignment.baseline,
//                     textBaseline: TextBaseline
//                         .alphabetic, // Align with the baseline of the text
//                     children: [
//                       const Icon(
//                         Icons.fiber_manual_record,
//                         size: 8,
//                         color: AppColors.neutral600,
//                       ),
//                       const SizedBox(
//                         width: 8,
//                       ),
//                       Expanded(
//                         child: Text(
//                           'Strong visual portfolio with clear understanding of UI methodologies',
//                           style:
//                               AppTextStyle.textSRegular(AppColors.neutral600),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 ListTile(
//                   title: Row(
//                     crossAxisAlignment: CrossAxisAlignment.baseline,
//                     textBaseline: TextBaseline
//                         .alphabetic, // Align with the baseline of the text

//                     children: [
//                       const Icon(
//                         Icons.fiber_manual_record,
//                         size: 8,
//                         color: AppColors.neutral600,
//                       ),
//                       const SizedBox(
//                         width: 8,
//                       ),
//                       Expanded(
//                         child: Text(
//                           'Ability to create hi-fidelity mock-ups in Figma',
//                           style:
//                               AppTextStyle.textSRegular(AppColors.neutral600),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 ListTile(
//                   title: Row(
//                     crossAxisAlignment: CrossAxisAlignment.baseline,
//                     textBaseline: TextBaseline
//                         .alphabetic, // Align with the baseline of the text
//                     children: [
//                       const Icon(
//                         Icons.fiber_manual_record,
//                         size: 8,
//                         color: AppColors.neutral600,
//                       ),
//                       const SizedBox(
//                         width: 8,
//                       ),
//                       Expanded(
//                         child: Text(
//                           'Ability to create various graphics for the web e.g. illustrations and icons',
//                           style:
//                               AppTextStyle.textSRegular(AppColors.neutral600),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 ListTile(
//                   title: Row(
//                     crossAxisAlignment: CrossAxisAlignment.baseline,
//                     textBaseline: TextBaseline
//                         .alphabetic, // Align with the baseline of the text
//                     children: [
//                       const Icon(
//                         Icons.fiber_manual_record,
//                         size: 8,
//                         color: AppColors.neutral600,
//                       ),
//                       const SizedBox(
//                         width: 8,
//                       ),
//                       Expanded(
//                         child: Text(
//                           'Able to facilitate workshops and liaise with stakeholders',
//                           style:
//                               AppTextStyle.textSRegular(AppColors.neutral600),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 ListTile(
//                   title: Row(
//                     crossAxisAlignment: CrossAxisAlignment.baseline,
//                     textBaseline: TextBaseline
//                         .alphabetic, // Align with the baseline of the text
//                     children: [
//                       const Icon(
//                         Icons.fiber_manual_record,
//                         size: 8,
//                         color: AppColors.neutral600,
//                       ),
//                       const SizedBox(
//                         width: 8,
//                       ),
//                       Expanded(
//                         child: Text(
//                           'Proficiency in the Adobe Creative Suite',
//                           style:
//                               AppTextStyle.textSRegular(AppColors.neutral600),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 ListTile(
//                   title: Row(
//                     crossAxisAlignment: CrossAxisAlignment.baseline,
//                     textBaseline: TextBaseline
//                         .alphabetic, // Align with the baseline of the text
//                     children: [
//                       const Icon(
//                         Icons.fiber_manual_record,
//                         size: 8,
//                         color: AppColors.neutral600,
//                       ),
//                       const SizedBox(
//                         width: 8,
//                       ),
//                       Expanded(
//                         child: Text(
//                           'Confident communicator with an analytical mindset',
//                           style:
//                               AppTextStyle.textSRegular(AppColors.neutral600),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 ListTile(
//                   title: Row(
//                     crossAxisAlignment: CrossAxisAlignment.baseline,
//                     textBaseline: TextBaseline
//                         .alphabetic, // Align with the baseline of the text
//                     children: [
//                       const Icon(
//                         Icons.fiber_manual_record,
//                         size: 8,
//                         color: AppColors.neutral600,
//                       ),
//                       const SizedBox(
//                         width: 8,
//                       ),
//                       Expanded(
//                         child: Text(
//                           'Design library/Design system experience',
//                           style:
//                               AppTextStyle.textSRegular(AppColors.neutral600),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 ListTile(
//                   title: Row(
//                     crossAxisAlignment: CrossAxisAlignment.baseline,
//                     textBaseline: TextBaseline
//                         .alphabetic, // Align with the baseline of the text
//                     children: [
//                       const Icon(
//                         Icons.fiber_manual_record,
//                         size: 8,
//                         color: AppColors.neutral600,
//                       ),
//                       const SizedBox(
//                         width: 8,
//                       ),
//                       Expanded(
//                         child: Text(
//                           '4+ years of commercial experience in UI/Visual Design',
//                           style:
//                               AppTextStyle.textSRegular(AppColors.neutral600),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

