part of 'fetch_data_cubit.dart';

@immutable
sealed class FetchDataState {}

final class FetchDataInitial extends FetchDataState {}

final class FetchDataFailure extends FetchDataState {
  final String error;

  FetchDataFailure({required this.error});
}

final class FetchDataLoading extends FetchDataState {}

final class FetchDataAllProducts extends FetchDataState {
  final List<ProductEntity> productList;
  FetchDataAllProducts({required this.productList});
}

final class FetchDataSingleProduct extends FetchDataState {
  final ProductEntity product;

  FetchDataSingleProduct({required this.product});
}

final class FetchDataCategories extends FetchDataState {
  final List<CategoryEntity> categoryList;
  FetchDataCategories({required this.categoryList});
}
