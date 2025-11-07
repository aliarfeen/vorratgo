import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vorratgo/core/DI/web_services/web_services_di.dart';
import 'package:vorratgo/core/data/model/user.dart';

class LocalRepo {
  final SharedPreferences prefs = sl<SharedPreferences>();

  Future<void> saveUser(UserModel user) async {
    await prefs.setString('user', jsonEncode(user.toMap()));
  }

  UserModel? getUser() {
    final data = prefs.getString('user');
    if (data == null) return null;
    return UserModel.fromMap(jsonDecode(data));
  }

  Future<void> saveGuestMode(bool isGuest) async {
    await prefs.setBool('isGuest', isGuest);
  }

  bool getGuestMode() {
    return prefs.getBool('isGuest') ?? false;
  }

  Future<void> clearAll() async {
    await prefs.clear();
  }
}
