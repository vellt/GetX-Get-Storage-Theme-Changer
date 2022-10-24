import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

enum Themes {
  light,
  dark,
  next,
}

class ThemeController extends GetxController {
  //list of custom colors
  IconData get themeIcon => (!isDarkMode) ? Icons.dark_mode : Icons.light_mode;

  Color get mainTextColor => (!isDarkMode) ? Colors.black : Colors.white;

  Color get backgroundColor => (!isDarkMode) ? Colors.white : Colors.black;

  Color get mainBackgroundColor =>
      (!isDarkMode) ? Color(0xFFECECEC) : Color(0xFF272727);

  //here are the main settings
  final lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Status bar
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
  );
  final darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Status bar
        statusBarIconBrightness: Brightness.light,
      ),
    ),
  );

  RxBool _isDarkMode = false.obs;
  final _box = GetStorage();
  bool get isDarkMode => _isDarkMode.value;
  ThemeData get currentTheme => isDarkMode ? darkTheme : lightTheme;

  void setTheme({required Themes theme}) {
    if (theme == Themes.next) {
      _isDarkMode.value = !isDarkMode;
      setTheme(theme: (isDarkMode) ? Themes.dark : Themes.light);
    } else {
      _isDarkMode.value = (theme == Themes.dark);
      Get.changeThemeMode((isDarkMode) ? ThemeMode.dark : ThemeMode.light);
      _box.write('darkmode', isDarkMode);
    }
  }

  @override
  void onInit() {
    super.onInit();
    _isDarkMode.listen((p0) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: backgroundColor,
        systemNavigationBarIconBrightness:
            (p0) ? Brightness.light : Brightness.dark,
      ));
    });
    _isDarkMode.value = _box.read('darkmode') ?? false;
    ever(_isDarkMode, (_) => print("is dark mode on: $_"));
    setTheme(theme: (_isDarkMode.value) ? Themes.dark : Themes.light);
  }
}
