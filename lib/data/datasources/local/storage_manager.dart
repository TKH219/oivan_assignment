import 'dart:convert';

import 'package:oivan_assignment/data/entities/entity.dart';
import 'package:oivan_assignment/domain/model/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _sofBookmarkedUsersKey = "_userAccountKey";

class StorageManager {
  static final StorageManager instance = StorageManager._internal();

  StorageManager._internal();

  factory StorageManager() {
    return instance;
  }

  late SharedPreferences prefs;

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  List<SofUserModel> get getSofBookmarkedUsers {
    try {
      List<String>? jsonString = prefs.getStringList(_sofBookmarkedUsersKey);
      if (jsonString == null || jsonString.isEmpty) {
        return [];
      } else {
        List<SofUserModel> result = jsonString.map((e) => SofUserModel.fromJson(jsonDecode(e))).toList();
        return result;
      }
    }catch (e){
      return [];
    }
  }

  void setSofBookmarkedUsers(List<SofUserModel> listUsers) {
    List<String> _listUsers = listUsers.map((element) => json.encode(element.toJson())).toList();
    prefs.setStringList(_sofBookmarkedUsersKey, _listUsers);
  }
}