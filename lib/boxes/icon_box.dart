import 'package:flutter/material.dart';

class IconBox {
  final bool isDarkMode;

  IconBox(this.isDarkMode);

  IconData get themeIcon => (!isDarkMode) ? Icons.dark_mode : Icons.light_mode;
}
