import 'dart:convert';
import 'dart:developer';
import 'package:manzon/domain/entities/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String _userKey = 'manzon_user';

  Future<void> saveUser(UserEntity user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = jsonEncode(user.toJson());
      await prefs.setString(_userKey, userJson);
      log('user save in local storage !!!!!$userJson');
    } catch (e) {
      log('Error saving user: $e');
    }
  }

  Future<UserEntity?> getUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString(_userKey);
      if (userJson != null) {
      log('retrive user from local storage !!!!!$userJson');
        return UserEntity.fromJson(jsonDecode(userJson));
      }
    } catch (e) {
      log('Error retrieving user: $e');
    }
    return null;
  }

   Future<String?> getUserId() async {
    try {
      final user = await getUser();
      return user?.id;
    } catch (e) {
      log('Error retrieving userId: $e');
    }
    return null;
  }

  Future<void> clearUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_userKey);
      log('clear user info in local storage');
    } catch (e) {
      log('Error clearing user: $e');
    }
  }
}
