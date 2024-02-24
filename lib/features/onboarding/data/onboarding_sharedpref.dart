import 'package:flutter_application_1/core/utils/local_storage_helper.dart';

class OnBoardingSharedPref {

  static void setBool(bool value) async {
    await LocalStorageHelper.setBool('board', value);
  }


}
