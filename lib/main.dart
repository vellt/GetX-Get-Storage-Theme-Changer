import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:Theme/screens/home_screen.dart';

import 'global.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleBuilder(builder: (_) {
      return GetMaterialApp(
        title: 'Theme',
        debugShowCheckedModeBanner: false,
        theme: theme.lightTheme,
        darkTheme: theme.darkTheme,
        home: HomeScreen(),
      );
    });
  }
}
