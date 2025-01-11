import 'package:fpdart/src/either.dart';
import 'package:test_task/src/core/error/failure.dart';
import 'package:test_task/src/core/error/server_exception.dart';
import 'package:test_task/src/data/data_source/product_remote_data_source.dart';
import 'package:test_task/src/domain/entity/category_entity.dart';
import 'package:test_task/src/domain/entity/product_entity.dart';
import 'package:test_task/src/domain/repo/product_repo.dart';

class ProductRepoImp implements ProductRepo {
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepoImp({required this.productRemoteDataSource});
  @override
  Future<Either<Failure, List<ProductEntity>>> fetchAllProducts() async {
    try {
      final resp = await productRemoteDataSource.fetchAllProducts();
      return right(resp);
    } on ServerException catch (serverException) {
      return left(Failure(serverException.message));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> fetchProductByCategory(
      String url) async {
    try {
      final resp = await productRemoteDataSource.fetchProductByCategory(url);
      return right(resp);
    } on ServerException catch (serverException) {
      return left(Failure(serverException.message));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> fetchProductCategory() async {
    try {
      final resp = await productRemoteDataSource.fetchProductCategory();
      return right(resp);
    } on ServerException catch (serverException) {
      return left(Failure(serverException.message));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> fetchSingleProduct(
      int productId) async {
    try {
      final resp = await productRemoteDataSource.fetchSingleProduct(productId);
      return right(resp);
    } on ServerException catch (serverException) {
      return left(Failure(serverException.message));
    }
  }
}
