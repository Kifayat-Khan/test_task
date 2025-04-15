import 'package:fpdart/src/either.dart';
import 'package:test_task/src/core/error/failure.dart';
import 'package:test_task/src/core/error/local_exception.dart';
import 'package:test_task/src/data/data_source/product_local_data_source.dart';
import 'package:test_task/src/data/model/product_model.dart';
import 'package:test_task/src/domain/entity/product_entity.dart';
import 'package:test_task/src/domain/repo/product_local_data_repo.dart';

class ProductLocalDataRepoImp implements ProductLocalRepo {
  final ProductLocalDataSource productLocalDataSource;

  ProductLocalDataRepoImp({required this.productLocalDataSource});
  @override
  Future<Either<Failure, List<ProductEntity>>> getFavoriteProducts() async {
    try {
      final resp = await productLocalDataSource.getFavoriteProducts();
      return right(resp);
    } on LocalException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> removeFavoriteProduct(
      ProductModel product) async {
    try {
      final resp = await productLocalDataSource.removeFavoriteProduct(product);
      return right(resp);
    } on LocalException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> storeFavoriteProduct(
      ProductModel product) async {
    try {
      final resp = await productLocalDataSource.storeFavoriteProduct(product);
      return right(resp);
    } on LocalException catch (e) {
      return left(Failure(e.message));
    }
  }
}
