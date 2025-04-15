import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_task/src/core/use_case/use_case.dart';
import 'package:test_task/src/data/model/product_model.dart';
import 'package:test_task/src/domain/entity/product_entity.dart';
import 'package:test_task/src/domain/use_case/product_local_data_use_case.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final StoreFavoriteProductUseCase _storeFavoriteProductUseCase;
  final GetFavoriteProductsUseCase _getFavoriteProductsUseCase;
  final RemoveFavoriteProductUseCase _removeFavoriteProductUseCase;
  FavoriteCubit({
    required StoreFavoriteProductUseCase storeFavoriteProductUseCase,
    required GetFavoriteProductsUseCase getFavoriteProductsUseCase,
    required RemoveFavoriteProductUseCase removeFavoriteProductUseCase,
  })  : _storeFavoriteProductUseCase = storeFavoriteProductUseCase,
        _getFavoriteProductsUseCase = getFavoriteProductsUseCase,
        _removeFavoriteProductUseCase = removeFavoriteProductUseCase,
        super(FavoriteInitial());

  void storeFavorite(ProductModel product) async {
    final resp = await _storeFavoriteProductUseCase(product);
    resp.fold(
      (failure) => emit(
        FavoriteFailure(error: failure.message),
      ),
      (right) => emit(
        FavoriteSuccess(),
      ),
    );
  }

  void removeFavorite(ProductModel product) async {
    final resp = await _removeFavoriteProductUseCase(product);
    resp.fold(
      (failure) => emit(
        FavoriteFailure(error: failure.message),
      ),
      (right) => emit(
        FavoriteSuccess(),
      ),
    );
  }

  void getFavorite() async {
    final resp = await _getFavoriteProductsUseCase(NoParams());
    resp.fold(
      (failure) => emit(
        FavoriteFailure(error: failure.message),
      ),
      (products) => emit(
        FavoriteLoaded(products: products),
      ),
    );
  }
}
