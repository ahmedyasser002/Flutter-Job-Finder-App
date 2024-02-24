import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageHelper {
  static SharedPreferences? _prefs;
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static setStrings(String key, String value) {
    // localStorage.setString(key,value);
    _prefs!.setString(key, value);
  }
 static int? getIntegers(String key) {
  // Return the result of getInt
  return _prefs!.getInt(key);
}

static setIntegers(String key, int value) {
  // localStorage.setString(key,value);
  _prefs!.setInt(key, value);
}


  static getStrings(String key) {
    if (_prefs!.getString(key) != null) {
      return _prefs!.getString(key)!;
    } else {
      return '';
    }
  }

  static setBool(String key, bool value) {
    return _prefs!.setBool(key, value);
  }

  static getBool(String key) {
    return _prefs!.getBool(key);
  }

  static setList(String key, List<String> items) {
    return _prefs!.setStringList(key, items);
  }

  static getList(String key) {
    return _prefs!.getStringList(key);
  }
}
