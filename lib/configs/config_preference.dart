import 'package:shared_preferences/shared_preferences.dart';

class ConfigPreference {
  // prevent making instance
  ConfigPreference._();

  // get storage
  static late SharedPreferences _sharedPreferences;

  // STORING KEYS
  static const String _lightThemeKey = 'is_theme_light';
  static const String _isFirstLaunchKey = 'is_first_launch';
  static const String _appLanguageCode = 'app_language_code';
  static const String _appLanguageCountryCode = 'app_language_country_code';

  /// init get storage services
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static setStorage(SharedPreferences sharedPreferences) {
    _sharedPreferences = sharedPreferences;
  }

  /// set theme current type as light theme
  static Future<void> setThemeIsLight(bool lightTheme) =>
      _sharedPreferences.setBool(_lightThemeKey, lightTheme);

  /// get if the current theme type is light
  static bool getThemeIsLight() =>
      _sharedPreferences.getBool(_lightThemeKey) ?? true;
  // todo set the default theme (true for light, false for dark)

  /// check if the app is first launch
  static bool isFirstLaunch() =>
      _sharedPreferences.getBool(_isFirstLaunchKey) ?? true;

  /// est first launch flag to false
  static Future<void> setFirstLaunchCompleted() =>
      _sharedPreferences.setBool(_isFirstLaunchKey, false);

  static String getAppLanguageCode() =>
      _sharedPreferences.getString(_appLanguageCode) ?? 'am';

  static Future<void> setAppLanguageCode(String appLanguage) =>
      _sharedPreferences.setString(_appLanguageCode, appLanguage);

  static String getAppLanguageCountryCode() =>
      _sharedPreferences.getString(_appLanguageCountryCode) ?? 'ET';

  static Future<void> setAppLanguageCountryCode(String appLanguageCountry) =>
      _sharedPreferences.setString(_appLanguageCountryCode, appLanguageCountry);

  /// clear all data from shared pref
  static Future<void> clear() async => await _sharedPreferences.clear();
}
