import 'dart:convert';

import 'package:test_task/src/core/error/server_exception.dart';
import 'package:test_task/src/core/network/product_api.dart';
import 'package:test_task/src/data/model/category_model.dart';
import 'package:test_task/src/data/model/product_model.dart';
import 'package:http/http.dart' as http;

abstract interface class ProductRemoteDataSource {
  Future<List<ProductModel>> fetchAllProducts();
  Future<ProductModel> fetchSingleProduct(int productId);
  Future<List<CategoryModel>> fetchProductCategory();
  Future<List<ProductModel>> fetchProductByCategory(String url);
}

class ProductRemoteDataSourceImp implements ProductRemoteDataSource {
  @override
  Future<List<ProductModel>> fetchAllProducts() async {
    try {
      final response = await http.get(Uri.parse(ProductApi.fetchAllProduct));

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedJson = json.decode(response.body);

        if (decodedJson.containsKey('products')) {
          final List<dynamic> productJsonList = decodedJson['products'];
          return productJsonList
              .map((productJson) => ProductModel.fromJson(productJson))
              .toList();
        } else {
          throw ServerException(
              "Invalid API response: 'products' key not found");
        }
      } else {
        throw ServerException(
            'Failed to load products: ${response.statusCode}');
      }
    } catch (error) {
      throw ServerException(error.toString());
    }
  }

  @override
  Future<List<ProductModel>> fetchProductByCategory(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedJson = json.decode(response.body);

        if (decodedJson.containsKey('products')) {
          final List<dynamic> productJsonList = decodedJson['products'];
          return productJsonList
              .map((productJson) => ProductModel.fromJson(productJson))
              .toList();
        } else {
          throw ServerException(
              "Invalid API response: 'products' key not found");
        }
      } else {
        throw ServerException(
            'Failed to load products: ${response.statusCode}');
      }
    } catch (error) {
      throw ServerException(error.toString());
    }
  }

  @override
  Future<List<CategoryModel>> fetchProductCategory() async {
    try {
      // Sending the GET request
      final response =
          await http.get(Uri.parse(ProductApi.fetchProductCategory));

      // Checking the response status
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);

        return jsonData
            .map((categoryName) => CategoryModel.fromJson(categoryName))
            .toList();
      } else {
        throw ServerException(
            'Failed to fetch categories. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw ServerException('Error fetching categories $e');
    }
  }

  @override
  Future<ProductModel> fetchSingleProduct(int productId) async {
    final String url = '${ProductApi.fetchSingleProduct}/$productId';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return ProductModel.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        throw ServerException(
            'Error: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      throw ServerException('Exception occurred: $e');
    }
  }
}
