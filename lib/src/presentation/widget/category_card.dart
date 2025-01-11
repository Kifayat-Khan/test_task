import 'package:flutter/material.dart';
import 'package:test_task/src/core/common/widget/app_text.dart';
import 'package:test_task/src/core/theme/app_pallet.dart';
import 'package:test_task/src/domain/entity/category_entity.dart';
import 'package:test_task/src/presentation/screens/product_by_category_screen.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoryEntity,
  });
  final CategoryEntity categoryEntity;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ProductByCategoryScreen(
                    category: categoryEntity.name!,
                    categoryUrl: categoryEntity.url!)));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), // Rounded corners
          image: DecorationImage(
            image: AssetImage(
                'assets/svg_icons/test.png'), // category api not have images
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            color:
                Colors.black.withValues(alpha: 0.2), // Semi-transparent overlay
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: BodyText(
              text: "${categoryEntity.name}",
              color: AppPallet.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
