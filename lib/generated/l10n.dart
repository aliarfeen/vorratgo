// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Discover Products You Love\n\nExplore top categories and trending items tailored just for you.`
  String get onboarding_caption_0 {
    return Intl.message(
      'Discover Products You Love\n\nExplore top categories and trending items tailored just for you.',
      name: 'onboarding_caption_0',
      desc: '',
      args: [],
    );
  }

  /// `Everything You Need, Delivered Fast\n\nFrom daily essentials to special finds — shop anytime, anywhere with VorratGo.`
  String get onboarding_caption_1 {
    return Intl.message(
      'Everything You Need, Delivered Fast\n\nFrom daily essentials to special finds — shop anytime, anywhere with VorratGo.',
      name: 'onboarding_caption_1',
      desc: '',
      args: [],
    );
  }

  /// `Get Exclusive Deals & Offers\n\nUnlock limited-time discounts and special promotions — only on VorratGo.`
  String get onboarding_caption_2 {
    return Intl.message(
      'Get Exclusive Deals & Offers\n\nUnlock limited-time discounts and special promotions — only on VorratGo.',
      name: 'onboarding_caption_2',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get get_started {
    return Intl.message('Get Started', name: 'get_started', desc: '', args: []);
  }

  /// `Add Phone Number`
  String get add_number {
    return Intl.message(
      'Add Phone Number',
      name: 'add_number',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number to receive a verification code.`
  String get add_number_description {
    return Intl.message(
      'Please enter your phone number to receive a verification code.',
      name: 'add_number_description',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get add_number_hint {
    return Intl.message(
      'Phone Number',
      name: 'add_number_hint',
      desc: '',
      args: [],
    );
  }

  /// `Send Code`
  String get add_number_button {
    return Intl.message(
      'Send Code',
      name: 'add_number_button',
      desc: '',
      args: [],
    );
  }

  /// `Verify Your Phone Number`
  String get verify_your_number {
    return Intl.message(
      'Verify Your Phone Number',
      name: 'verify_your_number',
      desc: '',
      args: [],
    );
  }

  /// `Enter the 6-digit code sent to your phone number.`
  String get verify_your_number_description {
    return Intl.message(
      'Enter the 6-digit code sent to your phone number.',
      name: 'verify_your_number_description',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verification_button_label {
    return Intl.message(
      'Verify',
      name: 'verification_button_label',
      desc: '',
      args: [],
    );
  }

  /// `Login as Guest`
  String get login_as_guest {
    return Intl.message(
      'Login as Guest',
      name: 'login_as_guest',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categries {
    return Intl.message('Categories', name: 'categries', desc: '', args: []);
  }

  /// `Bakery`
  String get bakery {
    return Intl.message('Bakery', name: 'bakery', desc: '', args: []);
  }

  /// `Beverages`
  String get beverages {
    return Intl.message('Beverages', name: 'beverages', desc: '', args: []);
  }

  /// `Canned Foods`
  String get canned_foods {
    return Intl.message(
      'Canned Foods',
      name: 'canned_foods',
      desc: '',
      args: [],
    );
  }

  /// `Cheese`
  String get chesse {
    return Intl.message('Cheese', name: 'chesse', desc: '', args: []);
  }

  /// `Grocery`
  String get grocery {
    return Intl.message('Grocery', name: 'grocery', desc: '', args: []);
  }

  /// `Pet Foods`
  String get pet_foods {
    return Intl.message('Pet Foods', name: 'pet_foods', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
