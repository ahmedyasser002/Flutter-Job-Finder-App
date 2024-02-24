import 'package:flutter_application_1/features/saved_notifications/controller/notify_state.dart';
import 'package:flutter_application_1/features/saved_notifications/presentation/widgets/notific_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotifyCubit extends Cubit<NotifyState> {
  // bool isRead = false;
  List notifyList = [
    NotiContainer(
      notifiContent: 'Posted new design jobs',
      notificImg: 'Dana.png',
      notificName: 'Dana',
      notificTime: '10:00AM',
    ),
    NotiContainer(
      notifiContent: 'Posted new design jobs',
      notificImg: 'Shoope.png',
      notificName: 'Shoope',
      notificTime: '10:00AM',
    ),
    NotiContainer(
      notifiContent: 'Posted new design jobs',
      notificImg: 'Slack.png',
      notificName: 'Slack',
      notificTime: '10:00AM',
    ),
    NotiContainer(
      notifiContent: 'Posted new design jobs',
      notificImg: 'Facebook.png',
      notificName: 'Facebook',
      notificTime: '10:00AM',
    ),
  ];
  List yesterdayNotify = [
    NotiContainer(
      notifiContent:
          'Your email setup was successful with the following details: Your new email is rafifdianganz@gmail.com.',
      notificImg: 'sms.png',
      notificName: 'Email setup successful',
      notificTime: '10:00AM',
      isYesterday: true,
    ),
    NotiContainer(
      notifiContent:
          'Hello Rafif Dian Axelingga, thank you for registering Jobsque. Enjoy the various features that....',
      notificImg: 'search-status.png',
      notificName: 'Welcome to Jobsque',
      notificTime: '10:00AM',
      isYesterday: true,
      isActive: false,
    ),
  ];
  void isEmptyNotify() {
    if (notifyList.isEmpty && yesterdayNotify.isEmpty) {
      emit(EmptyNotificationsState());
    }
  }

  NotifyCubit() : super(GetInitialNotifyState()) {
    isEmptyNotify();
  }
}
