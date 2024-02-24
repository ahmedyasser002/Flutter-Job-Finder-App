class MessageModel {
  String imgUrl;
  String senderName;
  String senderMsg;
  String msgTime;
  bool isRead;
  MessageModel(
      {required this.imgUrl,
      required this.senderMsg,
      required this.senderName,
      required this.msgTime,
      required this.isRead
      });
}
