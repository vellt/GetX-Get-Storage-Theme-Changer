import 'package:flutter/material.dart';

class ColorBox {
  final bool isDarkMode;

  ColorBox(this.isDarkMode);

  Color get mainText => (!isDarkMode) ? Colors.black : Colors.white;

  Color get background => (!isDarkMode) ? Colors.white : Colors.black;

  Color get mainButton => (!isDarkMode) ? Color(0xFFECECEC) : Color(0xFF272727);
}
