import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:vorratgo/core/network/api_service.dart';
import 'package:vorratgo/core/network/dio_factory.dart';
import 'package:vorratgo/features/products/cubit/product_cubit.dart';
import 'package:vorratgo/features/products/data/repository/products_repo.dart';
import 'package:vorratgo/features/products/data/repository/products_repo_implement.dart';
import 'package:vorratgo/features/products/data/sources/product_remote_data_source_impl.dart';

final sl = GetIt.instance;

Future<void> initDI() async {
  // Dio
  sl.registerLazySingleton<Dio>(() => DioFactory.createDio());

  // ApiService
  sl.registerLazySingleton<ApiService>(() => ApiService(sl()));

  // DataSource
  sl.registerLazySingleton<ProductRemoteDataSourceImpl>(
    () => ProductRemoteDataSourceImpl(sl()),
  );

  // Repository
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(sl()),
  );

  //Inject Cubit
  sl.registerFactory(() => ProductCubit(sl())); // sl() => ProductRepository
}
