import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vorratgo/features/onboarding/data/repositories/onboarding_repository.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final OnboardingRepository _onboardingRepository;

  OnboardingCubit(this._onboardingRepository) : super(OnboardingInitial()) {
    _loadOnboardingStatus();
  }

  Future<void> _loadOnboardingStatus() async {
    final bool hasSeen = _onboardingRepository.hasSeenOnboarding();
    emit(OnboardingStatusLoaded(hasSeen));
  }

  Future<void> completeOnboarding() async {
    await _onboardingRepository.setOnboardingComplete();
    emit(const OnboardingStatusLoaded(true));
  }
}
