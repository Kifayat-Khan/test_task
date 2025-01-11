import 'package:flutter/material.dart';
import 'package:test_task/src/core/common/widget/app_text.dart';
import 'package:test_task/src/core/common/widget/network_image_widget.dart';
import 'package:test_task/src/core/extenstions/context_extention.dart';
import 'package:test_task/src/core/theme/app_pallet.dart';
import 'package:test_task/src/domain/entity/product_entity.dart';
import 'package:test_task/src/presentation/screens/product_detail_screen.dart';
import 'package:test_task/src/presentation/widget/rate_widget.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductCard({
    super.key,
    required this.productEntity,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) =>
                    ProductDetailScreen(productEntity: productEntity)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Section
              ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(12)),
                  child: NetworkImageWidget(
                    imageUrl: productEntity.thumbnail!,
                    height: context.height(0.2),
                    width: double.infinity,
                    fit: BoxFit.contain,
                  )
                  // Image.asset(
                  //   'assets/svg_icons/test.png', // Replace with your asset image path
                  //   height: context.height(0.2),
                  //   width: double.infinity,
                  //   fit: BoxFit.cover,
                  // ),
                  ),
              SizedBox(height: 10),
              // Product Details Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: context.width(0.55),
                    child: LabelText(
                      text: "${productEntity.title}",
                    ),
                  ),
                  LabelText(
                    text: "\$${productEntity.price}",
                  ),
                ],
              ),

              RatingWidget(
                rate: 3,
              ),
              BodyText(
                text: "${productEntity.brand}",
                color: AppPallet.gray,
                fontSize: 12,
                fontWeight: FontWeight.w100,
              ),
              SizedBox(
                height: 10,
              ),
              BodyText(
                text: "In ${productEntity.category}",
                color: AppPallet.primary,
                fontSize: 12,
                fontWeight: FontWeight.w100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
