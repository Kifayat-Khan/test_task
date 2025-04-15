import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/src/core/common/widget/app_text.dart';
import 'package:test_task/src/core/common/widget/network_image_widget.dart';
import 'package:test_task/src/core/theme/app_pallet.dart';
import 'package:test_task/src/data/model/product_model.dart';
import 'package:test_task/src/domain/entity/product_entity.dart';
import 'package:test_task/src/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:test_task/src/presentation/widget/rate_widget.dart';

class FavoritesCard extends StatelessWidget {
  final ProductEntity productEntity;
  const FavoritesCard({
    super.key,
    required this.productEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: ListTile(
        minLeadingWidth: 0,
        title: Row(
          children: [
            //--image
            // ClipRRect(
            //     borderRadius:
            //         BorderRadius.vertical(bottom: Radius.circular(12)),
            //     child: NetworkImageWidget(
            //       imageUrl: productEntity.thumbnail!,
            //       width: 80,
            //       height: 80,
            //       fit: BoxFit.contain,
            //     )
            //     ),

            Container(
              width: 80,
              height: 80,
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // image: DecorationImage(
                //   scale: 8,
                //   image: AssetImage('assets/svg_icons/test.png'),
                //   fit: BoxFit.cover,
                // ),
              ),
              child: NetworkImageWidget(
                imageUrl: productEntity.thumbnail!,
                width: 80,
                height: 80,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelText(text: productEntity.brand ?? '' //"iPhone 14",
                    ),
                BodyText(
                  text: "\$${productEntity.price}",
                  color: AppPallet.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w100,
                ),
                RatingWidget(rate: 3),
              ],
            ),
          ],
        ),
        trailing: InkWell(
          onTap: () {
            context
                .read<FavoriteCubit>()
                .removeFavorite(productEntity as ProductModel);
          },
          child: Icon(
            Icons.favorite,
            color: AppPallet.red,
          ),
        ),
      ),
    );
  }
}
