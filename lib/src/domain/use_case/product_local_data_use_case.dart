import 'package:fpdart/fpdart.dart';
import 'package:test_task/src/core/error/failure.dart';
import 'package:test_task/src/core/use_case/use_case.dart';
import 'package:test_task/src/data/model/product_model.dart';
import 'package:test_task/src/domain/entity/product_entity.dart';
import 'package:test_task/src/domain/repo/product_local_data_repo.dart';

//--store favorite
class StoreFavoriteProductUseCase implements UseCase<void, ProductModel> {
  final ProductLocalRepo productLocalRepo;

  StoreFavoriteProductUseCase({required this.productLocalRepo});

  @override
  Future<Either<Failure, void>> call(ProductModel product) async {
    return await productLocalRepo.storeFavoriteProduct(product);
  }
}

//--get favorite
class GetFavoriteProductsUseCase
    implements UseCase<List<ProductEntity>, NoParams> {
  final ProductLocalRepo productLocalRepo;

  GetFavoriteProductsUseCase({required this.productLocalRepo});

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) async {
    return await productLocalRepo.getFavoriteProducts();
  }
}

//---delete favorite
class RemoveFavoriteProductUseCase implements UseCase<void, ProductModel> {
  final ProductLocalRepo productLocalRepo;

  RemoveFavoriteProductUseCase({required this.productLocalRepo});

  @override
  Future<Either<Failure, void>> call(ProductModel product) async {
    return await productLocalRepo.removeFavoriteProduct(product);
  }
}
