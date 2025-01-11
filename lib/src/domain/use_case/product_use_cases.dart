import 'package:fpdart/src/either.dart';
import 'package:test_task/src/core/error/failure.dart';
import 'package:test_task/src/core/use_case/use_case.dart';
import 'package:test_task/src/domain/entity/category_entity.dart';
import 'package:test_task/src/domain/entity/product_entity.dart';
import 'package:test_task/src/domain/repo/product_repo.dart';

class FetchAllProductsUseCase
    implements UseCase<List<ProductEntity>, NoParams> {
  final ProductRepo productRepo;

  FetchAllProductsUseCase({required this.productRepo});
  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) async {
    return await productRepo.fetchAllProducts();
  }
}

//--single product
class FetchSingleProductUseCase implements UseCase<ProductEntity, int> {
  final ProductRepo productRepo;

  FetchSingleProductUseCase({required this.productRepo});

  @override
  Future<Either<Failure, ProductEntity>> call(int productId) async {
    return await productRepo.fetchSingleProduct(productId);
  }
}

//--product  category
class FetchProductCategoryUseCase
    implements UseCase<List<CategoryEntity>, NoParams> {
  final ProductRepo productRepo;

  FetchProductCategoryUseCase({required this.productRepo});

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParams params) async {
    return await productRepo.fetchProductCategory();
  }
}

//--product by category
class FetchProductByCategoryUseCase
    implements UseCase<List<ProductEntity>, String> {
  final ProductRepo productRepo;

  FetchProductByCategoryUseCase({required this.productRepo});

  @override
  Future<Either<Failure, List<ProductEntity>>> call(String url) async {
    return await productRepo.fetchProductByCategory(url);
  }
}
