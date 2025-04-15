import 'package:test_task/src/domain/entity/category_entity.dart';

List<CategoryEntity> filterCategoriesByText(
    List<CategoryEntity> categories, String searchText) {
  return categories.where((category) {
    final name = category.name?.toLowerCase() ?? '';
    return name.contains(searchText.toLowerCase());
  }).toList();
}
