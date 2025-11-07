import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:vorratgo/core/data/repository/select_lang_repository.dart';

class ChangeLangCubit extends Cubit<Locale> {
  final SelectLangRepository _languageRepository;
  ChangeLangCubit(this._languageRepository)
    : super(_languageRepository.getSavedLanguage());

  void toggleLanguage() async {
    final newLocale =
        state.languageCode == 'en' ? const Locale('ar') : const Locale('en');
    await _languageRepository.saveLanguage(
      newLocale.languageCode,
    ); // Save the new language
    emit(newLocale); // Emit the new state
  }

  void setLanguage(Locale locale) async {
    await _languageRepository.saveLanguage(locale.languageCode);
    emit(locale);
  }
}
