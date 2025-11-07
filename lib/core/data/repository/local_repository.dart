import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vorratgo/core/data/model/user.dart';

class LocalRepo {
  static const String userKey = 'cached_user';

  Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userKey, jsonEncode(user.toMap()));
  }

  Future<UserModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(userKey);
    if (data == null) return null;
    return UserModel.fromMap(jsonDecode(data));
  }

  Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(userKey);
  }
}
