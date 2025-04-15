import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_task/src/core/error/local_exception.dart';
import 'package:test_task/src/data/model/product_model.dart';

abstract interface class ProductLocalDataSource {
  Future<void> storeFavoriteProduct(ProductModel product);
  Future<void> removeFavoriteProduct(ProductModel product);
  Future<List<ProductModel>> getFavoriteProducts();
  bool isFavorite(String id);
}

class ProductLocalDataSourceImp implements ProductLocalDataSource {
  final Box favoriteBox;

  ProductLocalDataSourceImp({required this.favoriteBox});
  @override
  Future<List<ProductModel>> getFavoriteProducts() async {
    try {
      final productList = favoriteBox.values
          .whereType<Map>()
          .map((map) => ProductModel.fromJson(Map<String, dynamic>.from(map)))
          .toList();
      return productList;
    } catch (e) {
      throw LocalException(e.toString());
    }
  }

  @override
  Future<void> storeFavoriteProduct(ProductModel product) async {
    try {
      await favoriteBox.put(product.id.toString(), product.toJson());
    } catch (e) {
      throw LocalException(e.toString());
    }
  }

  @override
  Future<void> removeFavoriteProduct(ProductModel product) async {
    try {
      await favoriteBox.delete(product.id.toString());
    } catch (e) {
      throw LocalException(e.toString());
    }
  }

  @override
  bool isFavorite(String id) {
    try {
      return favoriteBox.containsKey(id);
    } catch (e) {
      throw LocalException(e.toString());
    }
  }
}
