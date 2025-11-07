import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

final sl = GetIt.instance;

Future<void> initDI() async {
  // ---------------------------
  // Dio & Api
  // ---------------------------
  sl.registerLazySingleton<Dio>(() => DioFactory.createDio());
  sl.registerLazySingleton<ApiService>(() => ApiService(sl()));

  // ---------------------------
  // Firebase & SharedPrefs
  // ---------------------------
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  if (!sl.isRegistered<SharedPreferences>()) {
    final sharedPrefs = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  }
  // ---------------------------
  //  Product Feature
  // ---------------------------
  sl.registerLazySingleton<ProductRemoteDataSourceImpl>(
    () => ProductRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(sl()),
  );

  sl.registerFactory(() => ProductCubit(sl()));

  // ---------------------------
  //  User Repository & Cubits
  // ---------------------------
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(sl<FirebaseAuth>(), sl<FirebaseFirestore>()),
  );

  sl.registerFactory(
    () => FirebaseEmailPasswordAuthCubit(sl<UserRepository>()),
  );
  sl.registerFactory(() => UserProfileCubit(sl<UserRepository>()));
}
