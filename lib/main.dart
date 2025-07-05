import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/UI/auth/providers/switch_provider.dart';
import 'package:movies_app/UI/auth/screens/resetPassword.dart';
import 'package:movies_app/UI/auth/screens/signInScreen.dart';
import 'package:movies_app/UI/auth/screens/signUpScreen.dart';
import 'package:movies_app/UI/main_layer/main_layer_screen.dart';
import 'package:movies_app/UI/main_layer/provider/selected_cat_provider.dart';
import 'package:movies_app/UI/main_layer/tabs/homeTab/model/movies_list_response.dart';
import 'package:movies_app/UI/movieDetails/view/movie_details_screen.dart';
import 'package:movies_app/UI/movieDetails/viewModel/favourite_cubit.dart';
import 'package:movies_app/UI/onboarding/onboarding_screens/onboarding_screen_1.dart';
import 'package:movies_app/UI/auth/providers/token_provider.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/core/utils/app_theme.dart';
import 'package:movies_app/generated/l10n.dart';
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
          create: (_) => SwitchProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AvatarBottomSheetProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SelectedCatProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TokenProvider()..loadToken(),
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
    final tokenProvider = context.watch<TokenProvider>();
    if (!tokenProvider.isTokenLoaded) {
      return const MaterialApp(
        home: Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      );
    }
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData,
        themeMode: ThemeMode.light,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: context.watch<SwitchProvider>().isActive == false
            ? Locale('en')
            : Locale('ar'),
        supportedLocales: S.delegate.supportedLocales,
        routes: {
          SignInScreen.routeName: (_) => SignInScreen(),
          OnboardingScreen1.routeName: (_) => OnboardingScreen1(),
          OnboardingScreen2.routeName: (_) => OnboardingScreen2(),
          UpdateProfileScreen.routeName: (_) => UpdateProfileScreen(),
          MainLayerScreen.routeName: (_) => const MainLayerScreen(),
          ResetPassword.routeName: (_) => ResetPassword(),
          SignUpScreen.routeName: (_) => SignUpScreen(),
          MovieDetailsScreen.routeName: (context) {
            Movies movie = ModalRoute.of(context)!.settings.arguments as Movies;
            return BlocProvider(
              create: (context) => FavouriteCubit(),
              child: MovieDetailsScreen(
                movie: movie,
              ),
            );
          }
        },
        initialRoute: getInitialRoute(tokenProvider),
      ),
    );
  }

  String getInitialRoute(TokenProvider tokenProvider) {
    if (AppPrefs.onboardingGetBool(AppConstants.onboardingKey) == null) {
      return OnboardingScreen1.routeName;
    } else if (tokenProvider.token != null) {
      return MainLayerScreen.routeName;
    } else {
      return SignInScreen.routeName;
    }
  }
}
