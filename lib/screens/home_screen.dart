import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/theme_controller.dart';
import '../global.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: theme.mainBackgroundColor,
          title: Text(
            "Theme",
            style: TextStyle(color: theme.mainTextColor),
          ),
          centerTitle: true,
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                  onPressed: () {
                    theme.setTheme(theme: Themes.next);
                  },
                  child: Text(
                    'Change Theme',
                    style: TextStyle(color: theme.mainTextColor),
                  )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: theme.mainBackgroundColor,
          onPressed: () {
            theme.setTheme(theme: Themes.next);
          },
          child: Icon(theme.themeIcon, color: theme.mainTextColor),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
    });
  }
}
