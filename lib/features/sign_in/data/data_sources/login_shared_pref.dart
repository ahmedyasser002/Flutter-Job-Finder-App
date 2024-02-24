import 'package:flutter_application_1/core/utils/local_storage_helper.dart';

class LoginSharedPref {
  static String tokenKey = "token";
  static String nameKey = "name";
  static String rememberMeKey = 'Remember';
  static void setToken(String value) async {
    await LocalStorageHelper.setStrings(tokenKey, value);
  }

  static void setName(String name) async {
    await LocalStorageHelper.setStrings(nameKey, name);
  }

  static void rememberMe(bool value) async {
    await LocalStorageHelper.setBool(rememberMeKey, value);
  }
}
