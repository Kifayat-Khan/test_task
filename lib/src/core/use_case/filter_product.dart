import 'package:test_task/src/domain/entity/product_entity.dart';

List<ProductEntity> filterProductsByText(
    List<ProductEntity> products, String searchText) {
  final query = searchText.toLowerCase();

  return products.where((product) {
    final title = product.title?.toLowerCase() ?? '';
    final category = product.category?.toLowerCase() ?? '';

    return title.contains(query) || category.contains(query);
  }).toList();
}
