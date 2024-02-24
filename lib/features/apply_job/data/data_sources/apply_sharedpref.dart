import 'package:flutter_application_1/core/utils/local_storage_helper.dart';

class ApplySharedPref {
  static String applyKey = "apply";

  static setApply(bool isApply) async {
    
    await LocalStorageHelper.setBool(applyKey, isApply);
  }

  // static getSearchList() async {
  //   var searchList = await LocalStorageHelper.getList(searchHistoryKey);
  //   return searchList ?? "";
  // }
}
