import 'package:flutter/material.dart';
import 'package:movies_app/main_layer/main_layer_screen.dart';
import 'package:movies_app/onboarding/pageview_pages/onboarding_screen_1.dart';

import 'common/app_colors.dart';
import 'common/custom_text_styles.dart';
import 'onboarding/pageview_pages/onboarding_screen_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.black,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.black,
        textTheme: const TextTheme(
          bodySmall: CustomTextStyles.style14w400,
          bodyMedium: CustomTextStyles.style16w400,
          bodyLarge: CustomTextStyles.style20w400,
          labelSmall: CustomTextStyles.style36w500,
          labelMedium: CustomTextStyles.style20w600,
          labelLarge: CustomTextStyles.style20w700,
          titleSmall: CustomTextStyles.style24w700,
        ),
        dividerTheme: const DividerThemeData(
          color: AppColors.yellow,
          thickness: 1,
        ),
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.black),
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
      ),
      themeMode: ThemeMode.light,
      routes: {
        OnboardingScreen1.routeName: (_) => OnboardingScreen1(),
        OnboardingScreen2.routeName: (_) => OnboardingScreen2(),
        MainLayerScreen.routeName: (_) => const MainLayerScreen(),
      },
      initialRoute: //MainLayerScreen.routeName,
          OnboardingScreen1.routeName,
    );
  }
}
