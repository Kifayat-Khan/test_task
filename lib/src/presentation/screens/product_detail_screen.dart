import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_task/src/core/common/widget/app_text.dart';
import 'package:test_task/src/core/common/widget/network_image_widget.dart';
import 'package:test_task/src/core/common/widget/tital_app_bar.dart';
import 'package:test_task/src/core/extenstions/context_extention.dart';
import 'package:test_task/src/domain/entity/product_entity.dart';
import 'package:test_task/src/presentation/widget/product_detail_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductDetailScreen({
    super.key,
    required this.productEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(
        title: "${productEntity.title}",
      ),
      body: Column(
        children: [
          NetworkImageWidget(
            imageUrl: productEntity.thumbnail!,
            height: context.height(0.2),
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          // Image.asset(
          //   'assets/svg_icons/test.png', // Replace with your asset image path
          //   height: context.height(0.25),

          //   width: double.infinity,
          //   fit: BoxFit.fill,
          // ),
          ProductDetailsWidget(
            productEntity: productEntity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: context.height(0.25),
              child: DynamicHeightGridView(
                  itemCount: productEntity.images?.length ?? [].length,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  builder: (ctx, index) {
                    if (index == 0) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Product Gallery
                          BodyText(
                            text: "Product Gallery :",
                            fontSize: context.width(0.03),
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          NetworkImageWidget(
                            imageUrl: '${productEntity.images?[index]}',
                            height: context.height(0.15),
                            fit: BoxFit.cover,
                          )
                          // Image.asset(
                          //   'assets/svg_icons/test.png', // Replace with your asset image path
                          //   height: context.height(0.15),
                          //   fit: BoxFit.cover,
                          // )
                        ],
                      );
                    } else {
                      return NetworkImageWidget(
                        imageUrl: '${productEntity.images?[index]}',
                        height: context.height(0.15),
                        fit: BoxFit.cover,
                      );
                      // Image.asset(
                      //   'assets/svg_icons/test.png', // Replace with your asset image path
                      //   height: context.height(0.15),
                      //   fit: BoxFit.cover,
                      // );
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
