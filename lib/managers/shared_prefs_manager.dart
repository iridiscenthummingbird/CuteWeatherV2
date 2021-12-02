import 'package:cute_weather_v2/models/saved_prefs.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ISharedPreferencesManager {
  final SharedPreferences sharedPreferences;

  ISharedPreferencesManager({required this.sharedPreferences});

  void setPrefs(SavedPrefs prefs);
  SavedPrefs getPrefs();

  void setTheme(ThemeMode themeMode);
  ThemeMode getTheme();
}

class SharedPreferencesManager extends ISharedPreferencesManager {
  SharedPreferencesManager({required SharedPreferences sharedPreferences})
      : super(sharedPreferences: sharedPreferences);

  @override
  void setPrefs(SavedPrefs prefs) {
    sharedPreferences.setString("cityName", prefs.cityName);
    sharedPreferences.setDouble("lat", prefs.lat);
    sharedPreferences.setDouble("lon", prefs.lon);
  }

  @override
  SavedPrefs getPrefs() {
    return SavedPrefs(
      cityName: sharedPreferences.getString("cityName") ?? "London",
      lon: sharedPreferences.getDouble("lon") ?? -0.1257,
      lat: sharedPreferences.getDouble("lat") ?? 51.5085,
    );
  }

  @override
  ThemeMode getTheme() {
    var theme = sharedPreferences.getString("theme");
    if (theme == null) {
      return ThemeMode.system;
    } else if (theme == "dark") {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  @override
  void setTheme(ThemeMode themeMode) {
    if (themeMode == ThemeMode.dark) {
      sharedPreferences.setString("theme", "dark");
    } else {
      sharedPreferences.setString("theme", "light");
    }
  }
}
