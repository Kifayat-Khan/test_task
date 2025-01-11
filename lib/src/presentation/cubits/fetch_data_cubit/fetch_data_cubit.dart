import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_task/src/core/use_case/use_case.dart';
import 'package:test_task/src/domain/entity/category_entity.dart';
import 'package:test_task/src/domain/entity/product_entity.dart';
import 'package:test_task/src/domain/use_case/product_use_cases.dart';

part 'fetch_data_state.dart';

class FetchDataCubit extends Cubit<FetchDataState> {
  final FetchAllProductsUseCase fetchAllProductsUseCase;
  final FetchSingleProductUseCase fetchSingleProductUseCase;
  final FetchProductByCategoryUseCase productByCategoryUseCase;
  final FetchProductCategoryUseCase productCategoryUseCase;

  FetchDataCubit({
    required this.fetchAllProductsUseCase,
    required this.fetchSingleProductUseCase,
    required this.productByCategoryUseCase,
    required this.productCategoryUseCase,
  }) : super(FetchDataInitial());

  void fetchProduct() async {
    emit(FetchDataLoading());
    final resp = await fetchAllProductsUseCase(NoParams());
    resp.fold(
      (failure) => emit(
        FetchDataFailure(error: failure.message),
      ),
      (products) => emit(
        FetchDataAllProducts(productList: products),
      ),
    );
  }

  void fetchSingleProduct(int id) async {
    emit(FetchDataLoading());
    final resp = await fetchSingleProductUseCase(id);
    resp.fold(
      (failure) => emit(
        FetchDataFailure(error: failure.message),
      ),
      (products) => emit(
        FetchDataSingleProduct(
          product: products,
        ),
      ),
    );
  }

  void fetchProductsByCategory(String url) async {
    emit(FetchDataLoading());
    final resp = await productByCategoryUseCase(url);
    resp.fold(
      (failure) => emit(
        FetchDataFailure(error: failure.message),
      ),
      (products) => emit(
        FetchDataAllProducts(productList: products),
      ),
    );
  }

  void fetchCategory() async {
    emit(FetchDataLoading());
    final resp = await productCategoryUseCase(NoParams());
    resp.fold(
      (failure) => emit(
        FetchDataFailure(error: failure.message),
      ),
      (categories) => emit(FetchDataCategories(categoryList: categories)),
    );
  }
}
