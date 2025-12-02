import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vorratgo/bloc_observer.dart';
import 'package:vorratgo/core/DI/shared_prefernces/localization_di.dart';
import 'package:vorratgo/core/DI/web_services/web_services_di.dart';
import 'package:vorratgo/core/cubits/change_lang_cubit/change_lang_cubit.dart';
import 'package:vorratgo/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:vorratgo/core/cubits/fav_cubit/favorites_cubit.dart';
import 'package:vorratgo/core/routing/app_router.dart';
import 'package:vorratgo/vorrat_go.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();
  await initDI();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
    ),
  );

  Bloc.observer = AppBlocObserver();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ChangeLangCubit>()),
        BlocProvider<CartCubit>(create: (_) => sl<CartCubit>()),
        BlocProvider<FavoritesCubit>(
          create: (_) {
            final cubit = sl<FavoritesCubit>();
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              cubit.fetchFavoritesFirebase(user.uid);
            }
            return cubit;
          },
        ),
      ],
      child: VorratGo(appRouter: AppRouter()),
    ),
  );
}
