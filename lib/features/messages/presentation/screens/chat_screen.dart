import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/messages/presentation/widgets/chat_container.dart';
import 'package:flutter_application_1/features/messages/presentation/widgets/chat_modal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class ChatScreen extends StatefulWidget {
  String chatImg;
  String senderName;

  ChatScreen({super.key, required this.chatImg, required this.senderName});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var svgUrl = AppAssets.svgUrl;

  var imgUrl = AppAssets.imageUrl;

  var msgController = TextEditingController();

  List<String> senderMsgs = [
    'Hi Melan, thank you for considering me, this is good news for me.',
    'Of course, I can!'
  ];

  List<String> recvMsgs = [
    'Hi Rafif!, I\'m Melan the selection team from Twitter. Thank you for applying for a job at our company. We have announced that you are eligible for the interview stage.',
    'Can we have an interview via google meet call today at 3pm?',
    'Ok, here I put the google meet link for later this afternoon. I ask for the timeliness, thank you!',
    'Hi Rafif!, I\'m Melan the selection team from Twitter. Thank you for applying for a job at our company. We have announced that you are eligible for the interview stage.',
    'Can we have an interview via google meet call today at 3pm?',
    'Ok, here I put the google meet link for later this afternoon. I ask for the timeliness, thank you!',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(
                top: 12.h,
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(right: 24.w, left: 24.w, bottom: 24.h),
                    child: Row(
                      children: [
                        SvgPicture.asset('${svgUrl}arrow_left.svg'),
                        SizedBox(
                          width: 20.w,
                        ),
                        CircleAvatar(
                          backgroundImage: AssetImage(imgUrl + widget.chatImg),
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          widget.senderName,
                          style: AppTextStyle.textLMedium(AppColors.neutral900),
                        ),
                        const Spacer(),
                        InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return ChatModal(
                                       );
                                  });
                            },
                            child: SvgPicture.asset('${svgUrl}more.svg'))
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(right: 24.w, left: 24.w, top: 21.h),
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                color: AppColors.neutral200, width: 1.w)),
                        color: AppColors.neutral100),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Expanded(
                              child: Divider(
                                color: AppColors
                                    .neutral300, // Customize the color as needed
                                thickness:
                                    1.0, // Customize the thickness as needed
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 12.w, right: 12.w),
                              child: Text(
                                'Today,  Nov 13',
                                style: AppTextStyle.textMRegular(AppColors
                                    .neutral500), // Customize the text color as needed
                              ),
                            ),
                            const Expanded(
                              child: Divider(
                                color: AppColors
                                    .neutral300, // Customize the color as needed
                                thickness:
                                    1.0, // Customize the thickness as needed
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        SizedBox(
                            height: 568.h,
                            child: ListView.separated(
                                itemBuilder: ((context, index) {
                                  return index < recvMsgs.length
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            ChatContainer(
                                                isSender: false,
                                                chatText: recvMsgs[index]),
                                          ],
                                        )
                                      : const SizedBox();
                                }),
                                separatorBuilder: ((context, index) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: index <
                                                          senderMsgs.length &&
                                                      index < recvMsgs.length
                                                  ? 14.h
                                                  : 7.h),
                                          child: index < senderMsgs.length
                                              ? ChatContainer(
                                                  isSender: true,
                                                  chatText: senderMsgs[index])
                                              : null),
                                    ],
                                  );
                                }),
                                itemCount:
                                    max(senderMsgs.length, recvMsgs.length)))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 33.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: 42.w,
                          height: 42.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 1.w, color: AppColors.neutral300)),
                          child: SvgPicture.asset('${svgUrl}paperclip.svg'),
                        ),
                        SizedBox(
                            width: 195.w,
                            // height: 20.h,
                            child: TextField(
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1.w,
                                            color: AppColors.neutral200),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100.r))),
                                    contentPadding: const EdgeInsets.only(
                                        left: 16, top: 10, bottom: 10),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1.w,
                                            color: AppColors.neutral200),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100.r))),
                                    hintText: 'Write a message...',
                                    hintStyle: AppTextStyle.textMRegular(
                                        AppColors.neutral400),
                                    fillColor: AppColors.neutral200),
                                controller: msgController,
                                onSubmitted: (value) {
                                  setState(() {
                                    senderMsgs.add(value);
                                    msgController.clear();
                                  });
                                })),
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: 42.w,
                          height: 42.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 1.w, color: AppColors.neutral300)),
                          child: SvgPicture.asset(
                            '${svgUrl}mic.svg',
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
