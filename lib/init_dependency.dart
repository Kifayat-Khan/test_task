import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_task/src/core/common/search_cubit/search_cubit.dart';
import 'package:test_task/src/data/data_source/product_local_data_source.dart';
import 'package:test_task/src/data/data_source/product_remote_data_source.dart';
import 'package:test_task/src/data/repo_imp/product_local_data_repo_imp.dart';
import 'package:test_task/src/data/repo_imp/product_repo_imp.dart';
import 'package:test_task/src/domain/repo/product_local_data_repo.dart';
import 'package:test_task/src/domain/repo/product_repo.dart';
import 'package:test_task/src/domain/use_case/product_local_data_use_case.dart';
import 'package:test_task/src/domain/use_case/product_use_cases.dart';
import 'package:test_task/src/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:test_task/src/presentation/cubits/fetch_data_cubit/fetch_data_cubit.dart';
import 'package:test_task/src/presentation/cubits/home_tab_cubit/home_tab_cubit.dart';

final serviceLocator = GetIt.instance;
Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initProduct();
  await _initBlocs();
  await _initHive();
  await _initFavorite();
}

Future<void> _initHive() async {
  await Hive.initFlutter();
  final hiveBox = await Hive.openBox('favorite_products');
  serviceLocator.registerFactory(() => hiveBox);
}

Future<void> _initBlocs() async {
  serviceLocator
    ..registerFactory(
      () => HomeTabCubit(),
    )
    ..registerFactory(
      () => SearchCubit(),
    )
    ..registerFactory(
      () => FetchDataCubit(
        fetchAllProductsUseCase: serviceLocator(),
        fetchSingleProductUseCase: serviceLocator(),
        productByCategoryUseCase: serviceLocator(),
        productCategoryUseCase: serviceLocator(),
      ),
    );
}

Future<void> _initProduct() async {
  serviceLocator
    ..registerFactory<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImp(),
    )
    ..registerFactory<ProductRepo>(
      () => ProductRepoImp(
        productRemoteDataSource: serviceLocator(),
      ),
    )
    // Register use cases

    ..registerFactory<FetchAllProductsUseCase>(
      () => FetchAllProductsUseCase(
        productRepo: serviceLocator(),
      ),
    )
    ..registerFactory<FetchSingleProductUseCase>(
      () => FetchSingleProductUseCase(
        productRepo: serviceLocator(),
      ),
    )
    ..registerFactory<FetchProductCategoryUseCase>(
      () => FetchProductCategoryUseCase(
        productRepo: serviceLocator(),
      ),
    )
    ..registerFactory<FetchProductByCategoryUseCase>(
      () => FetchProductByCategoryUseCase(
        productRepo: serviceLocator(),
      ),
    );
}

Future<void> _initFavorite() async {
  serviceLocator
    ..registerFactory<ProductLocalDataSource>(
      () => ProductLocalDataSourceImp(
        favoriteBox: serviceLocator(),
      ),
    )
    ..registerFactory<ProductLocalRepo>(
      () => ProductLocalDataRepoImp(
        productLocalDataSource: serviceLocator(),
      ),
    )
    // Use Cases
    ..registerFactory(
      () => StoreFavoriteProductUseCase(
        productLocalRepo: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => RemoveFavoriteProductUseCase(
        productLocalRepo: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => GetFavoriteProductsUseCase(
        productLocalRepo: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => FavoriteCubit(
          storeFavoriteProductUseCase: serviceLocator(),
          getFavoriteProductsUseCase: serviceLocator(),
          removeFavoriteProductUseCase: serviceLocator()),
    );
}
