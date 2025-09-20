/*import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';


class SharedPrefHelper {
  /// can not anyone take an object from this class
  SharedPrefHelper._();

  static setData(String key, value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    switch (value.runtimeType) {
      case const (String):
        await sharedPreferences.setString(key, value);
        break;
      case const (Int):
        await sharedPreferences.setInt(key, value);
        break;
      case const (bool):
        await sharedPreferences.setBool(key, value);
        break;
      case const (double):
        await sharedPreferences.setDouble(key, value);
        break;
    }
  }

  static Future<String?> getString(String key) async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString(key);
  }

  static Future<int?> getInt(String key) async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getInt(key);
  }

  static Future<bool?> getBool(String key) async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getBool(key);
  }

  static Future<double?> getDouble(String key) async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getDouble(key);
  }
}*/
