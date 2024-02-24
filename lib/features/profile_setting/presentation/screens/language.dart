import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/my_appbar.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
// import 'package:flutter_application_1/core/style/app_colors.dart';
// import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/profile_setting/presentation/widgets/language_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  var svgUrl = AppAssets.svgUrl;

  String groupVal = '';
  List<String> flagNames = [
    'England.png',
    'ind.png',
    'ksa.png',
    'cna.png',
    'Netherlands.png',
    'France.png',
    'Germany.png',
    'Japan.png',
    'Korea.png',
    'Portugal.png'
  ];
  List<String> languages = [
    'English',
    'Indonesia',
    'Arabic',
    'Chinese',
    'Dutch',
    'French',
    'German',
    'Japanese',
    'Korean',
    'Portugese'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 0),
        child: Column(
          children: [
            MyAppBar(title: 'Language'),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: ListView.builder(
              itemCount: flagNames.length,
              itemBuilder: (BuildContext context, int index) {
                String flagName = flagNames[index];
            
                return LanguageContainer(
                  languageIcon: flagName,
                  languageText: languages[index], // You may want to change this based on the language
                  value: languages[index], // You may want to change this based on the language
                  groupValue: groupVal,
                  onContainerSelected: (selectedValue) {
                    setState(() {
                      groupVal = selectedValue;
                    });
                  },
                );
              },
            ),
            )
          
          ],
        ),
      )),
    );
  }
}
