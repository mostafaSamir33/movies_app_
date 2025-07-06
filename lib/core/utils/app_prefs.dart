import 'dart:convert';

import 'package:movies_app/core/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../UI/movieDetails/model/movie_details_model.dart';

class AppPrefs {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

//onboarding
  static Future<void> onboardingSetBool(String key, bool value) async {
    await prefs.setBool(key, value);
  }

  static bool? onboardingGetBool(String key) {
    return prefs.getBool(key);
  }

//localization
  static Future<void> localizationSetBool(String key, bool value) async {
    await prefs.setBool(key, value);
  }

  static bool? localizationGetBool(String key) {
    return prefs.getBool(key);
  }

// history tab in profile tab screen
  static Future<void> historySetSetOfString(
      {required String key, required MovieDetails? watchedMovie}) async {
    List<MovieDetails>? movies =
        (await AppPrefs.historyGetSetOfString(key: AppConstants.historyTabKey));

    if (movies.contains(watchedMovie)) {
      movies.remove(watchedMovie);
    }

    if (watchedMovie != null && !movies.contains(watchedMovie)) {
      movies.insert(0, watchedMovie);
    }

    List<String>? stringList = movies
        .map((m) => jsonEncode({
              'imdbCode': m.imdbCode,
              'rating': m.rating,
              'largeCoverImage': m.largeCoverImage,
            }))
        .toList();
    await prefs.setStringList(key, stringList);
  }

  static Future<List<MovieDetails>> historyGetSetOfString(
      {required String key}) async {
    List<String> stored = prefs.getStringList(key) ?? [];
    return stored.map((str) {
      final map = jsonDecode(str);
      return MovieDetails(
        imdbCode: map['imdbCode'] as String?,
        rating: (map['rating'] as num?)?.toDouble(),
        largeCoverImage: map['largeCoverImage'] as String?,
      );
    }).toList();
  }
}
