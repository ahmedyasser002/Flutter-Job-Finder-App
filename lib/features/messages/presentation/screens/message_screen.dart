import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/search_textfield.dart';
import 'package:flutter_application_1/core/style/app_assets.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_style.dart';
import 'package:flutter_application_1/features/bottom_bar/screens/bottom_bar.dart';
import 'package:flutter_application_1/features/messages/controller/message_cubit.dart';
import 'package:flutter_application_1/features/messages/controller/message_state.dart';
import 'package:flutter_application_1/features/messages/presentation/screens/chat_screen.dart';
import 'package:flutter_application_1/features/messages/presentation/widgets/message_container.dart';
import 'package:flutter_application_1/features/messages/presentation/widgets/message_filter_modal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class MessageScreen extends StatelessWidget {
  var svgUrl = AppAssets.svgUrl;
  var searchController = TextEditingController();

  MessageScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var myCubit = context.read<MessageCubit>();

    return BlocBuilder<MessageCubit, MessageState>(builder: (context, state) {
      if (state is NoMessageState) {
        return const Text('data');
      } else if (state is UnreadMessageState) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 16.h, 0, 0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                (MaterialPageRoute(
                                    builder: (context) => BottomBar())),
                                (route) => false);
                          },
                          child: SvgPicture.asset('${svgUrl}arrow_left.svg')),
                      Expanded(
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Messages',
                                style: AppTextStyle.headingFourMedium(
                                    AppColors.neutral900),
                              )))
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 267.w,
                        height: 48.h,
                        child: SearchTextfield(
                            hintText: 'Search messages....',
                            svgName: '${svgUrl}search-normal.svg',
                            onSubmittedCallback: (String val) {},
                            myController: searchController),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.w, color: AppColors.neutral300),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100.r))),
                        child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  // isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16.r),
                                      topRight: Radius.circular(16.r),
                                    ),
                                  ),
                                  builder: (context) {
                                    return MessageFilterModal(
                                      onUnreadPress: () {
                                        myCubit.getUnread();
                                      },
                                    );
                                  });
                            },
                            child: SvgPicture.asset('${svgUrl}filter.svg')),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 21.h),
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
                    decoration: BoxDecoration(
                        color: AppColors.neutral100,
                        border: Border.all(
                            width: 1.w, color: AppColors.neutral200)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Unread',
                          style: AppTextStyle.textMMedium(AppColors.neutral500),
                        ),
                        InkWell(
                            onTap: () {
                              myCubit.onReadAllMsgs();
                            },
                            child: Text(
                              'Read all messages',
                              style: AppTextStyle.textMMedium(
                                  AppColors.primary500),
                            ))
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: MessageContainer(
                              msg: myCubit.unReadMessages[index].senderMsg,
                              name: myCubit.unReadMessages[index].senderName,
                              imgName: myCubit.unReadMessages[index].imgUrl,
                              msgTime: myCubit.unReadMessages[index].msgTime,
                              isRead: myCubit.unReadMessages[index].isRead,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 20.h,
                          );
                        },
                        itemCount: myCubit.unReadMessages.length))
              ],
            ),
          ),
        );
      } else if (state is NoUnreadMessageState) {
        return const Text('data');
      }
      return SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 0),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                        Navigator.pushAndRemoveUntil(
                                    context, MaterialPageRoute(builder: (context)=>BottomBar()), (route) => false);
                    },
                    child: SvgPicture.asset('${svgUrl}arrow_left.svg')),
                  Expanded(
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Messages',
                            style: AppTextStyle.headingFourMedium(
                                AppColors.neutral900),
                          )))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 267.w,
                    height: 48.h,
                    child: SearchTextfield(
                        hintText: 'Search messages....',
                        svgName: '${svgUrl}search-normal.svg',
                        onSubmittedCallback: (String val) {},
                        myController: searchController),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24.h, bottom: 28.h),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.w, color: AppColors.neutral300),
                          borderRadius:
                              BorderRadius.all(Radius.circular(100.r))),
                      child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                // isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16.r),
                                    topRight: Radius.circular(16.r),
                                  ),
                                ),
                                builder: (context) {
                                  return MessageFilterModal(
                                    onUnreadPress: () {
                                      myCubit.getUnread();
                                    },
                                  );
                                });
                          },
                          child: SvgPicture.asset('${svgUrl}filter.svg')),
                    ),
                  )
                ],
              ),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            myCubit.messagesList[index].isRead = true;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatScreen(
                                          chatImg: myCubit
                                              .messagesList[index].imgUrl,
                                          senderName: myCubit
                                              .messagesList[index].senderName,
                                        )));
                          },
                          child: MessageContainer(
                            msg: myCubit.messagesList[index].senderMsg,
                            name: myCubit.messagesList[index].senderName,
                            imgName: myCubit.messagesList[index].imgUrl,
                            msgTime: myCubit.messagesList[index].msgTime,
                            isRead: myCubit.messagesList[index].isRead,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 20.h,
                        );
                      },
                      itemCount: myCubit.messagesList.length))
            ],
          ),
        ),
      );
    });
  }
}
