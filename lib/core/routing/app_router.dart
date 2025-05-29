import 'package:flutter/material.dart';
import 'package:vorratgo/features/authentication/presentaion/screens/add_phone_number.dart';
import 'package:vorratgo/features/home/presentation/screens/home.dart';
import 'package:vorratgo/features/select_language/prsentation/screens/select_lang.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/selectLanguage':
        return MaterialPageRoute(builder: (_) => const SelectLanguageScreen());
      case '/addPhoneNumber':
        // return MaterialPageRoute(builder: (_) => const AddPhoneNumberScreen());
        return MaterialPageRoute(builder: (_) => const AddPhoneNumberScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Center(child: Text('Page not found')),
        );
    }
  }
}
