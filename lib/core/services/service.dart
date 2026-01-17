import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../feature/product/data/data_source/product_data_source.dart';
import '../../feature/product/data/reposetry_imp/reposetry_imp.dart';
import '../../feature/product/domain/reposetry/product_reposetry.dart';
import '../../feature/product/domain/usecase/add_product.dart';
import '../../feature/product/domain/usecase/delete_product_usecase.dart';
import '../../feature/product/domain/usecase/get_product_usecase.dart';
import '../../feature/product/domain/usecase/update_product_usecase.dart';
import '../../feature/product/presentation/bloc/product_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init({required String baseUrl}) {
    // -------------------------------
    // External / Core
    // -------------------------------
    sl.registerLazySingleton<Dio>(() => Dio(BaseOptions(baseUrl: baseUrl)));

    // -------------------------------
    // DataSource
    // -------------------------------
    sl.registerLazySingleton<ProductDataSource>(
      () => ProductRemoteDataSource(dio: sl(), baseUrl: baseUrl),
    );

    // -------------------------------
    // Repository
    // -------------------------------
    sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(sl()),
    );

    // -------------------------------
    // UseCases
    // -------------------------------
    sl.registerLazySingleton(() => GetProductsUseCase(sl()));
    // sl.registerLazySingleton(() => AddProductUseCase(sl()));
    // sl.registerLazySingleton(() => UpdateProductUseCase(sl()));
    // sl.registerLazySingleton(() => DeleteProductUseCase(sl()));

    // -------------------------------
    // Cubit
    // -------------------------------
    sl.registerFactory(
      () => ProductCubit(
        getProductsUseCase: sl(),

      ),
    );
  }
}
