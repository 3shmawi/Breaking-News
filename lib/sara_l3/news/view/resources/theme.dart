import 'package:flutter/material.dart';

class AppTheme {
  static final light = ThemeData(
    colorScheme: const ColorScheme.light(),
    appBarTheme:  AppBarTheme(
      color: Colors.blue[900],
      foregroundColor: Colors.white,
    ),
  );

  static final dark = ThemeData(
    colorScheme: const ColorScheme.dark(),
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white,
    ),
  );
}
