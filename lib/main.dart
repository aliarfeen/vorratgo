import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vorratgo/core/DI/shared_prefernces/shared_pref_di.dart';
import 'package:vorratgo/core/DI/web_services/web_services_di.dart';
import 'package:vorratgo/core/cubits/cubit/change_lang_cubit.dart';
import 'package:vorratgo/core/routing/app_router.dart';
import 'package:vorratgo/vorrat_go.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await initDI();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    BlocProvider(
      create: (context) => getIt<ChangeLangCubit>(),
      child: VorratGo(appRouter: AppRouter()),
    ),
  );
}
