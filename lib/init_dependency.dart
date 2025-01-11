import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_task/src/data/data_source/product_remote_data_source.dart';
import 'package:test_task/src/data/repo_imp/product_repo_imp.dart';
import 'package:test_task/src/domain/repo/product_repo.dart';
import 'package:test_task/src/domain/use_case/product_use_cases.dart';
import 'package:test_task/src/presentation/cubits/fetch_data_cubit/fetch_data_cubit.dart';
import 'package:test_task/src/presentation/cubits/home_tab_cubit/home_tab_cubit.dart';

final serviceLocator = GetIt.instance;
Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initProduct();
  await initBlocs();
}

Future<void> initBlocs() async {
  serviceLocator
    ..registerFactory(
      () => HomeTabCubit(),
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

Future<void> initProduct() async {
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
