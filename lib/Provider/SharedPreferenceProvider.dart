import 'package:flutter/material.dart';
import 'package:flutter_project/Model/core/SharedPreferenceModel.dart';
import 'package:flutter_project/Model/core/UsersModel.dart';
import 'package:flutter_project/View/constants/enums.dart';
import 'package:flutter_project/View/widgets/logger_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceProvider {
  SharedPreferenceModel sharedPreferenceModel = SharedPreferenceModel();

  addUserDetails(UsersModel userModel) async {
    try {
      var userName = getEnumValue(UserDetails.userName);
      var userEmail = getEnumValue(UserDetails.userEmail);
      var userId = getEnumValue(UserDetails.userId);
      var userAccount = getEnumValue(UserDetails.userAccount);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(userName, userModel.firstName + " " + userModel.lastName);
      prefs.setString(userEmail, userModel.email);
      prefs.setInt(userId, userModel.id);
      prefs.setString(userAccount, userModel.rolesModel!.title);
    } catch (e) {
      loggerError(message: "Error on sharedPreferences: $e");
    }
  }

  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool userVal = prefs.containsKey("userId");
    return userVal;
  }

  logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  Future<String?> getStringValue(String value) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? spItem = prefs.getString(value);
      return spItem;
    } catch (e) {
      loggerError(message: 'Error on sharedPreferences [getStringValue]: $e');
    }
  }

  Future<int> getIntValue(String value) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? spItem = prefs.getInt(value);
      if (spItem != null) {
        return spItem;
      } else {
        return 1;
      }
    } catch (e) {
      loggerError(message: 'Error on sharedPreferences [getStringValue]: $e');
      throw Exception('Error on sharedPreferences [getStringValue]: $e');
    }
  }

  //remove
  removeValue(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(value);
  }
}
