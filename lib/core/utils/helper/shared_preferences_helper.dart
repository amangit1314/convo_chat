import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceHelper {
  SharedPrefrenceHelper._internal();
  static final SharedPrefrenceHelper _singleton =
      SharedPrefrenceHelper._internal();

  factory SharedPrefrenceHelper() {
    return _singleton;
  }

  Future<bool> saveLog(String log) async {
    return (await SharedPreferences.getInstance()).setString(
      'log',
      json.encode(log),
    );
  }

  Future<String?> getLog() async {
    return (await SharedPreferences.getInstance()).getString('log');
  }

  // set accessToken
  Future<bool> setAccessToken(String value) async {
    return (await SharedPreferences.getInstance())
        .setString(UserPreferenceKey.userProfile.toString(), value);
  }

  // get accessToken
  Future<String?> getAccessToken() async {
    return (await SharedPreferences.getInstance())
        .getString(UserPreferenceKey.userProfile.toString());
  }

  // set refereshToken
  Future<bool> setRefreshToken(String value) async {
    return (await SharedPreferences.getInstance())
        .setString(UserPreferenceKey.userProfile.toString(), value);
  }

  // get refereshToken
  Future<String?> getRefreshToken() async {
    return (await SharedPreferences.getInstance())
        .getString(UserPreferenceKey.userProfile.toString());
  }

  Future<bool> setUserProfile(String value) async {
    return (await SharedPreferences.getInstance())
        .setString(UserPreferenceKey.userProfile.toString(), value);
  }

  Future<String?> getUserProfile() async {
    return (await SharedPreferences.getInstance())
        .getString(UserPreferenceKey.userProfile.toString());
  }

  Future<bool> setUID(String value) async {
    return (await SharedPreferences.getInstance())
        .setString(UserPreferenceKey.uid.toString(), value);
  }

  Future<String?> getUID() async {
    return (await SharedPreferences.getInstance())
        .getString(UserPreferenceKey.uid.toString());
  }

  Future<String?> getLanguageCode() async {
    return (await SharedPreferences.getInstance())
        .getString(UserPreferenceKey.languageCode.toString());
  }

  Future<bool> setLanguageCode(String value) async {
    return (await SharedPreferences.getInstance())
        .setString(UserPreferenceKey.languageCode.toString(), value);
  }

  Future<bool?> getOnboardingSeen() async {
    return (await SharedPreferences.getInstance())
        .getBool(UserPreferenceKey.seenOnboarding.toString());
  }

  Future<bool> setOnboardingSeen(bool value) async {
    return (await SharedPreferences.getInstance())
        .setBool(UserPreferenceKey.seenOnboarding.toString(), value);
  }

  Future<bool?> getCollabOnboardingSeen() async {
    return (await SharedPreferences.getInstance())
        .getBool(UserPreferenceKey.seenCollabOnboarding.toString());
  }

  Future<bool> setCollabOnboardingSeen(bool value) async {
    return (await SharedPreferences.getInstance())
        .setBool(UserPreferenceKey.seenCollabOnboarding.toString(), value);
  }

  Future<String> getDeviceId() async {
    return (await SharedPreferences.getInstance())
            .getString(UserPreferenceKey.deviceId.toString()) ??
        '';
  }

  Future<bool> setDeviceId(String value) async {
    return (await SharedPreferences.getInstance())
        .setString(UserPreferenceKey.deviceId.toString(), value);
  }

  Future<bool> clearAll() async {
    (await SharedPreferences.getInstance())
        .remove(UserPreferenceKey.uid.toString());
    (await SharedPreferences.getInstance())
        .remove(UserPreferenceKey.userProfile.toString());
    (await SharedPreferences.getInstance())
        .remove(UserPreferenceKey.languageCode.toString());
    (await SharedPreferences.getInstance()).remove(getAccessToken.toString());
    (await SharedPreferences.getInstance()).remove(getAccessToken.toString());

    return true;
  }
}

enum UserPreferenceKey {
  uid,
  userProfile,
  languageCode,
  seenOnboarding,
  seenCollabOnboarding,
  deviceId
}
