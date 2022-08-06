import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../global.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: color.background,
        appBar: AppBar(),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                  onPressed: () {
                    color.changeTheme();
                  },
                  child: Text(
                    'Change Theme',
                    style: TextStyle(color: color.mainText),
                  )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: color.mainButton,
          onPressed: () {},
          tooltip: 'Increment',
          child: Icon(Icons.add, color: color.mainText),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
    });
  }
}
