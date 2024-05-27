import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        background: Colors.grey.shade900,
        primary: Colors.grey.shade600,
        secondary: const Color.fromARGB(255, 94, 94, 94),
        tertiary: Colors.grey.shade800,
        inversePrimary: Colors.grey.shade300));
