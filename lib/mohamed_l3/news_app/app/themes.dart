import 'package:c3/mohamed_l3/news_app/view/_resources/colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData light = ThemeData(
      colorScheme: const ColorScheme.light(),
      appBarTheme: AppBarTheme(
        backgroundColor: NewsColors.primary,
        foregroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: NewsColors.white,
        selectedItemColor: NewsColors.primary,
        unselectedItemColor: NewsColors.secondary,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
      ));

  static ThemeData dark = ThemeData(
      primaryColor: Colors.blue[900],
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue[900],
        elevation: 0, // No shadow
        iconTheme:
            const IconThemeData(color: Colors.white), // Color of AppBar icons
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        selectedItemColor: NewsColors.white,
        selectedIconTheme: IconThemeData(color: Colors.white),
        unselectedItemColor: NewsColors.secondary,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
      ));
}
