import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  late final Future<SharedPreferences> sharedPreferences;

  PreferencesHelper({required this.sharedPreferences});

  static const darkTheme = 'DARK_THEME';
  static const dailyNews = 'DAILY_NEWS';

  // Mengambil nilai boolean dari sharedPreferences
  // apakah sedang menggunakan Dark Theme atau tidak
  Future<bool> get isDarkTheme async {
    final prefs = await sharedPreferences;
    return prefs.getBool(darkTheme) ?? false;
  }

  // Melakukan set value Dark Theme pada sharedPreferences
  void setDarkTheme(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(darkTheme, value);
  }

  // Mengambil value dari key "dailyNews"
  // Melakukan checking apakah mengaktifkan notifikasi atau tidak
  Future<bool> get isDailyNewsActive async {
    final prefs = await sharedPreferences;
    return prefs.getBool(dailyNews) ?? false;
  }

  // Melakukan set value dailyNews pada sharedPreferences
  void setDailyNews(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(dailyNews, value);
  }
}
