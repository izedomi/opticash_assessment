import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/signin_response.dart';
import '../utils/storage_keys.dart';

class StorageService {
  /* ====== Token ========= */
  static Future<bool> storeAccessToken(String token) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(StorageKey.accessToken, token);
  }

  static Future<String?> getAccessToken() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey(StorageKey.accessToken) &&
        sharedPreferences.getString(StorageKey.accessToken) != null) {
      return sharedPreferences.getString(StorageKey.accessToken);
    }
    return null;
  }

  /* ====== AuthUser ========= */
  static Future<User?> getUser() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey(StorageKey.authUser) &&
        sharedPreferences.getString(StorageKey.authUser) != null) {
      return User.fromJson(
          json.decode(sharedPreferences.getString(StorageKey.authUser)!));
    }
    return null;
  }

  static Future<bool> storeUser(Map<String, dynamic> user) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(StorageKey.authUser, json.encode(user));
  }

  /* ====== Generic ========= */
  static Future reset() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    await sharedPreferences.remove(StorageKey.accessToken);
  }
}
