import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/my_appbar.dart';
import 'package:flutter_application_1/core/components/search_textfield.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
// import 'package:flutter_application_1/core/style/app_colors.dart';
// import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/profile_setting/presentation/widgets/help_container.dart';
import 'package:flutter_application_1/features/profile_setting/presentation/widgets/open_help_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  var svgUrl = AppAssets.svgUrl;
  List<HelpContainer> helpContainers = [
    HelpContainer(),
    HelpContainer(),
    HelpContainer(),
    HelpContainer(),
    HelpContainer(),
  ];

late List<bool> isOpenList;
  var myController = TextEditingController();
  @override
  void initState() {
    super.initState();
    isOpenList = List.generate(helpContainers.length, (index) => false);
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
              MyAppBar(title: 'Help center'),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 48.h,
                child: SearchTextfield(
                    svgName: '${svgUrl}search-normal.svg',
                    onSubmittedCallback: (value) {},
                    hintText: 'What can we help?',
                    myController: myController),
              ),
              SizedBox(
                height: 16.h,
              ),
              for (int i = 0; i <helpContainers.length ; i++)
                Column(
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            isOpenList[i] = !isOpenList[i];
                          });
                        },
                        child: isOpenList[i] ? OpenHelpContainer() : helpContainers[i]),
                    SizedBox(height: 16.h),
                  ],
                ),
            ],
          ),
        ),
      )),
    );
  }
}
