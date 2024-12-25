import'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static String userIdKey = "USERKEY";
  static String userNameKey = "USENAMEKEY";
  static String userEmailKey = "USERMAILKEY";
  static String userWalletKey = "USERWALLETKEY";
  static String userProfileKey = "USERPROFILEKEY";

  // Save User ID
  Future<bool> saveUserId(String getUserId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userIdKey, getUserId);
  }

  // Save User Name
  Future<bool> saveUserName(String getUserName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userNameKey, getUserName);
  }

  // Save User Email
  Future<bool> saveUserEmail(String getUserEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userEmailKey, getUserEmail);
  }

  // Save User Profile
  Future<bool> saveUserProfile(String getUserProfile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userProfileKey, getUserProfile);
  }

  // Get User ID
  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userIdKey);
  }

  // Get User Name
  Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userNameKey);
  }

  // Get User Email
  Future<String?> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmailKey);
  }

  // Get User Profile
  Future<String?> getUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userProfileKey);
  }
}
