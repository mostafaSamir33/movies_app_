import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/common/app_constants.dart';
import 'package:movies_app/common/screens/update_profile_screen.dart';
import 'package:movies_app/onboarding/onboarding_screens/onboarding_screen_1.dart';
import 'package:movies_app/main_layer/main_layer_screen.dart';
import 'package:movies_app/onboarding/pageview_pages/onboarding_screen_1.dart';

import 'common/app_colors.dart';
import 'common/app_prefs.dart';
import 'onboarding/onboarding_screens/onboarding_screen_2.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPrefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
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
              UpdateProfileScreen.routeName: (_) => UpdateProfileScreen(),
              MainLayerScreen.routeName: (_) => const MainLayerScreen(),
            },
            initialRoute:
                AppPrefs.onboardingGetBool(AppConstants.onboardingKey) == null
                    ? OnboardingScreen1.routeName
                    : UpdateProfileScreen.routeName,
          ),
    );
  }
}
