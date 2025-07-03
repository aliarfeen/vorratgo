import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vorratgo/core/widgets/main_navigation_screen.dart';
import 'package:vorratgo/features/onboarding/bloc/cubit/onboarding_cubit.dart';
import 'package:vorratgo/features/onboarding/presentaion/screens/onboarding.dart';
import 'package:vorratgo/features/select_language/prsentation/screens/select_lang.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Provide the SettingsCubit at the top level
    // because MaterialApp's theme depends on it.
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, onboardingState) {
        if (onboardingState is OnboardingInitial) {
          return const CircularProgressIndicator(); // Or splash screen
        } else if (onboardingState is OnboardingStatusLoaded) {
          if (onboardingState.hasSeenOnboarding) {
            return SelectLanguageScreen(); // Navigate to initialRoute
          } else {
            return OnboardingScreen();
          }
        }
        return const Text('Error'); // Fallback
      },
    );
  }
}
