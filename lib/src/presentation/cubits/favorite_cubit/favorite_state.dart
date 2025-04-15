part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {}

final class FavoriteFailure extends FavoriteState {
  final String error;

  FavoriteFailure({required this.error});
}

final class FavoriteLoaded extends FavoriteState {
  final List<ProductEntity> products;

  FavoriteLoaded({required this.products});
}

final class FavoriteSuccess extends FavoriteState {}
