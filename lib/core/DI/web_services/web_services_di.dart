import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vorratgo/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:vorratgo/core/cubits/fav_cubit/favorites_cubit.dart';
import 'package:vorratgo/core/data/repository/cart_repository.dart';
import 'package:vorratgo/core/data/repository/cart_repository_impl.dart';
import 'package:vorratgo/core/data/repository/favorites_repository.dart';
import 'package:vorratgo/core/data/repository/favorites_repository_impl.dart';
import 'package:vorratgo/core/data/repository/local_repository.dart';
import 'package:vorratgo/core/data/repository/user_repository.dart';
import 'package:vorratgo/core/data/repository/user_repository_impl.dart';
import 'package:vorratgo/core/network/api_service.dart';
import 'package:vorratgo/core/network/dio_factory.dart';
import 'package:vorratgo/features/products/cubit/product_cubit.dart';
import 'package:vorratgo/features/products/data/repository/products_repo.dart';
import 'package:vorratgo/features/products/data/repository/products_repo_implement.dart';
import 'package:vorratgo/features/products/data/sources/product_remote_data_source_impl.dart';
import 'package:vorratgo/core/cubits/user_auth_cubit/firebase_email_password_auth_cubit.dart';
import 'package:vorratgo/core/cubits/user_profile_cubit/user_profile_cubit.dart';
import 'package:vorratgo/features/profile_center/cubit/user_center_cubit.dart';

final sl = GetIt.instance;

Future<void> initDI() async {
  // Dio & Api
  sl.registerLazySingleton<Dio>(() => DioFactory.createDio());
  sl.registerLazySingleton<ApiService>(() => ApiService(sl()));

  // Firebase & SharedPrefs
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  if (!sl.isRegistered<SharedPreferences>()) {
    final sharedPrefs = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  }

  // Local Repo
  sl.registerLazySingleton<LocalRepo>(() => LocalRepo());

  // Product Feature
  sl.registerLazySingleton<ProductRemoteDataSourceImpl>(
    () => ProductRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(sl()),
  );
  sl.registerFactory(() => ProductCubit(sl()));

  // User Repository & Cubits
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(sl<FirebaseAuth>(), sl<FirebaseFirestore>()),
  );

  //  User Repository & Cubits --> Firebase & Firestore and more related injections to user
  sl.registerFactory(
    () => FirebaseEmailPasswordAuthCubit(sl<UserRepository>(), sl<LocalRepo>()),
  );
  sl.registerFactory(() => UserProfileCubit(sl<UserRepository>()));

  sl.registerFactory(() => UserProfileCenterCubit(sl<LocalRepo>()));

  // Cart Repository & Cubit
  sl.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(sl<FirebaseAuth>(), sl<FirebaseFirestore>()),
  );

  sl.registerLazySingleton(() => CartCubit(sl<CartRepository>()));

  // Favorites Repository & Cubit
  sl.registerLazySingleton<FavoritesRepository>(
    () => FavoritesRepositoryImpl(sl<FirebaseAuth>(), sl<FirebaseFirestore>()),
  );

  sl.registerLazySingleton(() => FavoritesCubit(sl<FavoritesRepository>()));
}

