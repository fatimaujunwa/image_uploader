import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService{
  final _getStorage=GetStorage();
  final storageKey="isDark";
  ThemeMode getThemeMode(){
    return isSavedAsDark()?ThemeMode.dark:ThemeMode.light;
  }
  bool isSavedAsDark(){
    return _getStorage.read(storageKey)??false;
  }
  void saveTheme(bool isDark){
    _getStorage.write(storageKey, isDark);
  }
  void changeThemeMode(){
    Get.changeThemeMode(isSavedAsDark()? ThemeMode.light:ThemeMode.dark);
    saveTheme(isSavedAsDark());
  }
}