import 'dart:convert';
import 'package:manzon/domain/entities/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:manzon/infrastructure/models/user_model.dart';


class LocalStorageService {
  static const String _userKey = 'manzon_user';

  Future<void> saveUser(UserEntity user) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = jsonEncode(user.toJson());
    await prefs.setString(_userKey, userJson);
  }

  Future<UserEntity?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_userKey);
    if (userJson != null) {
      return UserEntity.fromJson(jsonDecode(userJson));
    }
    return null;
  }

  Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}
