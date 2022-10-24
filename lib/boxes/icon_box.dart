import 'package:flutter/material.dart';

class IconBox {
  final bool isDarkMode;

  IconBox(this.isDarkMode);

  IconData get theme => (!isDarkMode) ? Icons.dark_mode : Icons.light_mode;
}
