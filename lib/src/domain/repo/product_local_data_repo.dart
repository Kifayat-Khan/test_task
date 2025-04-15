import 'package:fpdart/fpdart.dart';
import 'package:test_task/src/core/error/failure.dart';
import 'package:test_task/src/data/model/product_model.dart';
import 'package:test_task/src/domain/entity/product_entity.dart';

abstract interface class ProductLocalRepo {
  Future<Either<Failure, void>> storeFavoriteProduct(ProductModel product);
  Future<Either<Failure, void>> removeFavoriteProduct(ProductModel product);
  Future<Either<Failure, List<ProductEntity>>> getFavoriteProducts();
}
