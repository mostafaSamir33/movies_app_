import 'package:flutter/material.dart';
// import 'package:news_app/l10n/app_localizations.dart';

extension ContextExtension on BuildContext {
  TextTheme getTextTheme() {
    return Theme.of(this).textTheme;
  }

  ColorScheme getColorScheme() {
    return Theme.of(this).colorScheme;
  }

  Size getScreenSize() {
    return MediaQuery.of(this).size;
  }

  ThemeData getThemeData() {
    return Theme.of(this);
  }

  // AppLocalizations getLocalization(){
  //   return AppLocalizations.of(this)!;
  // }
}
