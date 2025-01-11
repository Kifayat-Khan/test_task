import 'package:test_task/src/domain/entity/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({super.slug, super.name, super.url});

  // Factory constructor to create a ProductModel from JSON
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      slug: json['slug'],
      name: json['name'],
      url: json['url'],
    );
  }

  // Method to convert a ProductModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'slug': slug,
      'name': name,
      'url': url,
    };
  }

  // Method to convert a JSON list to a list of ProductModel instances
  static List<CategoryModel> jsonListToClassList(
      List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => CategoryModel.fromJson(json)).toList();
  }

  // Method to convert a list of ProductModel instances to a JSON list
  static List<Map<String, dynamic>> classListToJsonList(
      List<CategoryModel> classList) {
    return classList.map((product) => product.toJson()).toList();
  }

  // Copy with method for cloning a ProductModel with optional field updates
  CategoryModel copyWith({String? slug, String? name, String? url}) {
    return CategoryModel(
      slug: slug ?? this.slug,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
