import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ChangeLangCubit extends Cubit<Locale> {
  ChangeLangCubit() : super(const Locale('en'));

  void toggleLanguage() {
    emit(state.languageCode == 'en' ? const Locale('ar') : const Locale('en'));
  }

  void setLanguage(Locale locale) {
    emit(locale);
  }
}
