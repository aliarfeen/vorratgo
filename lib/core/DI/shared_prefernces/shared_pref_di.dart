import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vorratgo/core/cubits/cubit/change_lang_cubit.dart';
import 'package:vorratgo/core/data/select_lang_repository.dart';
import 'package:vorratgo/features/onboarding/bloc/cubit/onboarding_cubit.dart';
import 'package:vorratgo/features/onboarding/data/repositories/onboarding_repository.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // // Register your repositories here
  getIt.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepository(getIt<SharedPreferences>()),
  );
  getIt.registerLazySingleton<SelectLangRepository>(
    () => SelectLangRepository(getIt<SharedPreferences>()),
  );
  // getIt.registerLazySingleton<UserRepository>(() => UserRepository(getIt()));

  // // Register your Cubits here, injecting their dependencies
  getIt.registerFactory<OnboardingCubit>(
    () => OnboardingCubit(getIt<OnboardingRepository>()),
  );
  getIt.registerFactory<ChangeLangCubit>(
    () => ChangeLangCubit(getIt<SelectLangRepository>()),
  );
  // // ... and so on for other Cubits
}
