// import 'package:shared_preferences/shared_preferences.dart';

// class HelperFunctions {
//   static String userLoggedInKey = '';
//   static String userNameKey = '';
//   static String userEmailKey = '';

//   Future<dynamic> getUserLoggedInStatus() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getBool(userLoggedInKey);
//   }

//   static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
//     SharedPreferences sf = await SharedPreferences.getInstance();
//     return await sf.setBool(userLoggedInKey, isUserLoggedIn);
//   }

//   static Future<bool> saveUserNameSF(String userName) async {
//     SharedPreferences sf = await SharedPreferences.getInstance();
//     return await sf.setString(userNameKey, userName);
//   }

//   static Future<bool> saveUserMobileSF(var phoneNumber) async {
//     SharedPreferences sf = await SharedPreferences.getInstance();
//     return await sf.setString(userNameKey, phoneNumber);
//   }

//   static Future<bool> saveUserEmailSF(String userEmail) async {
//     SharedPreferences sf = await SharedPreferences.getInstance();
//     return await sf.setString(userEmailKey, userEmail);
//   }

//   static Future<String?> getUserEmailFromSF() async {
//     SharedPreferences sf = await SharedPreferences.getInstance();
//     return sf.getString(userEmailKey);
//   }

//   static Future<String?> getUserNameFromSF() async {
//     SharedPreferences sf = await SharedPreferences.getInstance();
//     return sf.getString(userNameKey);
//   }
// }
