import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/UI/auth/screens/resetPassword.dart';
import 'package:movies_app/UI/auth/screens/signInScreen.dart';
import 'package:movies_app/UI/auth/screens/signUpScreen.dart';
import 'package:movies_app/UI/main_layer/main_layer_screen.dart';
import 'package:movies_app/UI/main_layer/provider/selected_cat_provider.dart';
import 'package:movies_app/UI/movieDetails/view/movie_details_screen.dart';
import 'package:movies_app/UI/onboarding/onboarding_screens/onboarding_screen_1.dart';
import 'package:movies_app/core/providers/token_provider.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/core/utils/app_theme.dart';
import 'package:provider/provider.dart';

import 'UI/main_layer/tabs/profileTab/screens/update_profile_screen.dart';
import 'UI/onboarding/onboarding_screens/onboarding_screen_2.dart';
import 'core/providers/avatar_bottom_sheet_provider.dart';
import 'core/utils/app_prefs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPrefs.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AvatarBottomSheetProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SelectedCatProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TokenProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Apptheme.themeData,
        themeMode: ThemeMode.light,
        routes: {
          SignInScreen.routeName: (_) => SignInScreen(),
          OnboardingScreen1.routeName: (_) => OnboardingScreen1(),
          OnboardingScreen2.routeName: (_) => OnboardingScreen2(),
          UpdateProfileScreen.routeName: (_) => UpdateProfileScreen(),
          MainLayerScreen.routeName: (_) => const MainLayerScreen(),
          ResetPassword.routeName: (_) => ResetPassword(),
          Signupscreen.routeName: (_) => Signupscreen(),
          MovieDetailsScreen.routeName: (_) => MovieDetailsScreen(),
        },
        initialRoute:
            AppPrefs.onboardingGetBool(AppConstants.onboardingKey) == null
                ? OnboardingScreen1.routeName
                : SignInScreen.routeName,
      ),
    );
  }
}
