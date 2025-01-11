import 'package:fpdart/fpdart.dart';
import 'package:test_task/src/core/error/failure.dart';
import 'package:test_task/src/domain/entity/category_entity.dart';
import 'package:test_task/src/domain/entity/product_entity.dart';

abstract interface class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> fetchAllProducts();
  Future<Either<Failure, ProductEntity>> fetchSingleProduct(int productId);
  Future<Either<Failure, List<CategoryEntity>>> fetchProductCategory();
  Future<Either<Failure, List<ProductEntity>>> fetchProductByCategory(
      String url);
}
