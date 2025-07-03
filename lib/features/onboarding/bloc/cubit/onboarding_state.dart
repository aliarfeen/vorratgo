part of 'onboarding_cubit.dart';

sealed class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object> get props => [];
}

final class OnboardingInitial extends OnboardingState {}

final class OnboardingStatusLoaded extends OnboardingState {
  final bool hasSeenOnboarding;

  const OnboardingStatusLoaded(this.hasSeenOnboarding);

  @override
  List<Object> get props => [hasSeenOnboarding];
}
