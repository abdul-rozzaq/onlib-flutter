import 'dart:convert';

import 'package:onlib/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static Future<String?> getToken() => SharedPreferences.getInstance().then((prefs) => prefs.getString('token'));
  static Future<bool> setToken(String token) => SharedPreferences.getInstance().then((prefs) => prefs.setString('token', token));
  static Future<bool> deleteToken() => SharedPreferences.getInstance().then((prefs) => prefs.remove('token'));

  static Future<User?> getUser() => SharedPreferences.getInstance().then((prefs) => prefs.getString('user') != null ? User.fromJson(jsonDecode(prefs.getString('user')!)) : null);
  static Future<bool?> setUser(User user) => SharedPreferences.getInstance().then((prefs) => prefs.setString('user', jsonEncode(user.toJson)));
  static Future<bool> deleteUser() => SharedPreferences.getInstance().then((prefs) => prefs.remove('user'));
}

