import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/bottom_bar/screens/bottom_bar.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class MyAppBar extends StatelessWidget {
  String title;
  Widget? widget;
  bool? isHome;
  MyAppBar({super.key, required this.title, this.widget , this.isHome});

  @override
  Widget build(BuildContext context) {
    var svgUrl = AppAssets.svgUrl;

    return Row(
      children: [
        InkWell(
            onTap: () {
              isHome!=null? Navigator.pushAndRemoveUntil(context, (MaterialPageRoute(builder: (context)=>BottomBar())), (route) => false) :
              widget != null
                  ? Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => widget!))
                  : Navigator.pop(context);
            },
            child: SvgPicture.asset('${svgUrl}arrow_left.svg')),
        Expanded(
            child: Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: AppTextStyle.headingFourMedium(AppColors.neutral900),
          ),
        ))
      ],
    );
  }
}
