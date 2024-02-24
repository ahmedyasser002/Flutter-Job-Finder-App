import 'package:flutter_application_1/core/utils/local_storage_helper.dart';

class SearchHistorySharedPref {
  static String searchHistoryKey = "searchList";

  static setSearchList(List<String> searchList) async {
    
    await LocalStorageHelper.setList(searchHistoryKey, searchList);
  }

  static getSearchList() async {
    var searchList = await LocalStorageHelper.getList(searchHistoryKey);
    return searchList ?? "";
  }
}
