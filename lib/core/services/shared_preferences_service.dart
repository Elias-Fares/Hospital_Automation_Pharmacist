import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../constant/constant.dart';

class SharedPreferencesService {
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveToken({required String? token}) async {
    if (token == null) {
      debugPrint("Cant save empty token");
      return;
    }
    debugPrint("debugger $token");
    await _prefs.setString(Constant.ACCESS_TOKEN, token);
  }

  String? getToken() {
    //TODO remove it after test

    // final testToken =
    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1hcmlhbS5mYXJlcy4yMDAyQGdtYWlsLmNvbSIsInVzZXJJZCI6MTUyLCJpYXQiOjE3NTQ1NzQ5MDJ9.YxIlydJyWv7QQF0g5Ak3tEE8nJ2KSSF9wzGk0wAq7t8";
    // return testToken;
    return _prefs.getString(Constant.ACCESS_TOKEN);
  }

  Future<void> clearToken() async {
    await _prefs.remove(Constant.ACCESS_TOKEN);
  }

  Future<void> saveEmail({required String? email}) async {
    if (email == null) {
      debugPrint("Cant save empty email");
      return;
    }
    await _prefs.setString(Constant.USER_EMAIL, email);
  }

  String? getEmail() {
    return _prefs.getString(Constant.USER_EMAIL);
  }

  Future<void> clearEmail() async {
    await _prefs.remove(Constant.USER_EMAIL);
  }

  Future<void> savePassword({required String? password}) async {
    if (password == null) {
      debugPrint("Cant save empty password");
      return;
    }
    await _prefs.setString(Constant.USER_PASSWORD, password);
  }

  String? getPassword() {
    return _prefs.getString(Constant.USER_PASSWORD);
  }

  Future<void> clearPassword() async {
    await _prefs.remove(Constant.USER_PASSWORD);
  }

  Future<void> saveUserName({required String? userName}) async {
    if (userName == null) {
      debugPrint("Cant save empty userName");
      return;
    }
    await _prefs.setString(Constant.USER_NAME, userName);
  }

  String? getUserName() {
    return _prefs.getString(Constant.USER_NAME);
  }

  Future<void> clearUserName() async {
    await _prefs.remove(Constant.USER_NAME);
  }

  Future<void> saveHasPermission({required bool? hasPermission}) async {
    debugPrint("HAS_PERMISSION is $hasPermission");

    if (hasPermission == null) {
      return;
    }
    await _prefs.setBool(Constant.HAS_PERMISSION, hasPermission);
  }

  bool? getHasPermission() {
    return _prefs.getBool(Constant.HAS_PERMISSION);
  }
}
