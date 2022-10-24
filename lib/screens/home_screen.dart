import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../global.dart';
import '../controllers/theme_controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
        init: theme,
        builder: (theme) {
          return Scaffold(
            backgroundColor: theme.color.background,
            appBar: AppBar(
              elevation: 0,
              shadowColor: Colors.transparent,
              backgroundColor: theme.color.mainButton,
              title: Text(
                "Theme",
                style: TextStyle(color: theme.color.mainText),
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
                        style: TextStyle(color: theme.color.mainText),
                      )),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              elevation: 0,
              backgroundColor: theme.color.mainButton,
              onPressed: () {
                theme.setTheme(theme: Themes.next);
              },
              child: Icon(theme.icon.themeIcon, color: theme.color.mainText),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          );
        });
  }
}
