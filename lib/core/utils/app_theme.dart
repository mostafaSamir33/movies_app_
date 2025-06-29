import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class Apptheme {
  static ThemeData themeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.black,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.black,
    dividerTheme: const DividerThemeData(
      color: AppColors.yellow,
      thickness: 1,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.black,
      foregroundColor: AppColors.yellow,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.grey,
      selectedItemColor: AppColors.yellow,
      unselectedItemColor: AppColors.white,
      selectedIconTheme: IconThemeData(size: 24),
      unselectedIconTheme: IconThemeData(size: 24),
    ),
  );
}
