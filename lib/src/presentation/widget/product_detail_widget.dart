import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/init_dependency.dart';
import 'package:test_task/src/core/common/widget/app_text.dart';
import 'package:test_task/src/core/extenstions/context_extention.dart';
import 'package:test_task/src/core/theme/app_pallet.dart';
import 'package:test_task/src/data/data_source/product_local_data_source.dart';
import 'package:test_task/src/data/model/product_model.dart';
import 'package:test_task/src/domain/entity/product_entity.dart';
import 'package:test_task/src/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:test_task/src/presentation/widget/rate_widget.dart';

class ProductDetailsWidget extends StatefulWidget {
  const ProductDetailsWidget({
    super.key,
    required this.productEntity,
  });
  final ProductEntity productEntity;

  @override
  State<ProductDetailsWidget> createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  bool isFavorite = false;
  @override
  void initState() {
    isFavorite = serviceLocator<ProductLocalDataSource>()
        .isFavorite(widget.productEntity.id.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row with "Product Details" and Heart Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BodyText(
                text: "Product Details:",
                fontSize: context.width(0.04),
                fontWeight: FontWeight.bold,
              ),
              BlocBuilder<FavoriteCubit, FavoriteState>(
                builder: (context, state) {
                  return InkWell(
                    onTap: () {
                      if (isFavorite) {
                        context.read<FavoriteCubit>().removeFavorite(
                            widget.productEntity as ProductModel);
                        isFavorite = false;
                      } else {
                        context.read<FavoriteCubit>().storeFavorite(
                            widget.productEntity as ProductModel);
                        isFavorite = true;
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.favorite_outline_sharp,
                        weight: 0.1,
                        size: context.width(0.07),
                        color: isFavorite
                            ? AppPallet.failureColor
                            : AppPallet.primary,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 8.0),
          // Product Details
          _RowWidget(label: "Name", value: "${widget.productEntity.title}"),
          _RowWidget(label: "Price", value: "\$${widget.productEntity.price}"),
          _RowWidget(
              label: "Category", value: "${widget.productEntity.category}"),
          _RowWidget(label: "Brand", value: "${widget.productEntity.brand}"),
          _RowWidget(
            label: "Rating",
            value: "${widget.productEntity.rating}",
            rateWidget: RatingWidget(rate: 5),
          ),
          _RowWidget(label: "Stock", value: "${widget.productEntity.stock}"),
          SizedBox(height: 8.0),
          // Description
          BodyText(
            text: "Description:",
            fontSize: context.width(0.03),
            fontWeight: FontWeight.bold,
          ),

          SizedBox(height: 8.0),
          SmallText(
            text: "${widget.productEntity.description}",
            fontSize: context.width(0.03),
            color: AppPallet.primary,
            fontWeight: FontWeight.w100,
          ),
        ],
      ),
    );
  }
}

class _RowWidget extends StatelessWidget {
  final String label;
  final String value;
  final Widget? rateWidget;
  const _RowWidget({
    required this.label,
    this.rateWidget,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BodyText(
            text: "$label :",
            fontSize: context.width(0.03),
            fontWeight: FontWeight.bold,
          ),
          if (rateWidget == null) ...{
            SmallText(
              text: "   $value",
              fontSize: context.width(0.03),
              color: AppPallet.primary,
              fontWeight: FontWeight.w100,
            ),
          } else ...{
            const SizedBox(
              width: 8,
            ),
            rateWidget!,
          }
        ],
      ),
    );
  }
}
