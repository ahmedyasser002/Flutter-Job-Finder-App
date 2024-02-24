import 'package:flutter_application_1/core/utils/local_storage_helper.dart';

class MyProfileLocalStorage {
  static String bioKey = 'bio';
  static String aboutKey = 'about';
  static String phoneKey = 'phone';
  static String addressKey = 'address';
  static setBio(String bio) async {
    await LocalStorageHelper.setStrings(bioKey, bio);
  }
  static setAbout(String about) async {
    await LocalStorageHelper.setStrings(aboutKey, about);
  }
  static setPhone(String phone) async {
    await LocalStorageHelper.setStrings(phoneKey, phone);
  }
  static setAddress(String address) async {
    await LocalStorageHelper.setStrings(addressKey, address);
  }
  static setProgress(int progress) async {
    await LocalStorageHelper.setIntegers('progress', progress);
  }

  // static Future<String> getBio() async {
  //   var bio = await LocalStorageHelper.getStrings(bioKey) ?? "";
  //   return bio ?? '';
  // }
}
