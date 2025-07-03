import 'package:shared_preferences/shared_preferences.dart';

class OnboardingRepository {
  final SharedPreferences _preferences;
  static const String _hasSeenOnboardingKey = 'hasSeenOnboarding';

  OnboardingRepository(this._preferences); // Inject SharedPreferences

  bool hasSeenOnboarding() {
    return _preferences.getBool(_hasSeenOnboardingKey) ?? false;
  }

  Future<void> setOnboardingComplete() async {
    await _preferences.setBool(_hasSeenOnboardingKey, true);
  }
}
