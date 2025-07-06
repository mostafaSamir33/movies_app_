import 'package:movies_app/UI/main_layer/tabs/homeTab/model/movies_list_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
//   static Future<void> historySetSet(String key, Set<Movies> value) async {
//     await prefs.setStringList(key, value.toList().map((e) => e,));
//   }

}
