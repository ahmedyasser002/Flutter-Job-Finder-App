import 'package:flutter_application_1/features/messages/controller/message_state.dart';
import 'package:flutter_application_1/features/messages/data/message_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageCubit extends Cubit<MessageState> {
  // bool isRead = false;
  List<MessageModel> messagesList = [
    MessageModel(
        imgUrl: 'twitterMsg.png',
        senderMsg: 'Hey Ahmed How Are You',
        senderName: 'Twitter',
        msgTime: '12:15',
        isRead: false),
    MessageModel(
        imgUrl: 'GojekLogo.png',
        senderMsg: 'Hey Ahmed How Are You',
        senderName: 'Gojek Indonesia',
        msgTime: '11:30',
        isRead: false),
    MessageModel(
        imgUrl: 'ahmed.jpg',
        senderMsg: 'Hey Ahmed How Are You',
        senderName: 'Ahmed Yasser',
        msgTime: '12:15',
        isRead: false),
    MessageModel(
        imgUrl: 'hazem.jpg',
        senderMsg: 'Hamada',
        senderName: 'Hazem Nounou',
        msgTime: '01:15',
        isRead: true),
    MessageModel(
        imgUrl: 'mohanad.jpeg',
        senderMsg: 'Hey Ahmed How Are You',
        senderName: 'Mohanad Mansour',
        msgTime: '12:15',
        isRead: true),
    MessageModel(
        imgUrl: 'ayman.jpg',
        senderMsg: 'Hey Ahmed How Are You',
        senderName: 'Mohamed Ayman',
        msgTime: '12:15',
        isRead: true),
    MessageModel(
        imgUrl: 'yasser.jpg',
        senderMsg: 'Aloo',
        senderName: 'Yasser',
        msgTime: '12:15',
        isRead: false),
  ];
  List<MessageModel> unReadMessages = [];
  MessageCubit() : super(GetInitialMessageState()) {
    getMessages();
  }
  getUnread() {
    for (var message in messagesList) {
      if (!message.isRead) {
        unReadMessages.add(message);
        emit(UnreadMessageState());
      }
    }
    if (unReadMessages.isEmpty) {
      emit(NoUnreadMessageState());
    }
  }

  onReadAllMsgs() {
    for (var msg in unReadMessages) {
      msg.isRead = true;
    }
    unReadMessages.clear();
    getMessages();
  }

  void getMessages() {
    if (messagesList.isEmpty) {
      emit(NoMessageState());
    } else {
      emit(MessageSuccessfulState());
    }
  }
}
