import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart'; // For Locale

class SelectLangRepository {
  final SharedPreferences _preferences;
  static const String _languageCodeKey = 'appLanguageCode';

  SelectLangRepository(this._preferences); // Inject SharedPreferences

  // Get the saved language code, defaults to 'en'
  Locale getSavedLanguage() {
    final String? langCode = _preferences.getString(_languageCodeKey);
    return Locale(langCode ?? 'en'); // Default to English if not found
  }

  // Save the new language code
  Future<void> saveLanguage(String languageCode) async {
    await _preferences.setString(_languageCodeKey, languageCode);
  }
}
