import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _preferences;
  static const _loginStatus = 'loginSta';
  static const _userData = 'userData';

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  setLoginStatus(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_loginStatus, value);
  }

  Future<bool> getLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_loginStatus) ?? false;
  }

  setUserData(String value) async {
    _preferences!.setString(_userData, value);
  }

  static String? getUserData() {
    return _preferences!.getString(_userData);
  }

  static Future<bool?> clearMemory() async {
    return await _preferences!.clear();
  }
}
