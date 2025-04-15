import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/src/core/common/search_cubit/search_cubit.dart';
import 'package:test_task/src/core/common/widget/app_text.dart';
import 'package:test_task/src/core/theme/app_pallet.dart';
import 'package:test_task/src/core/use_case/filter_product.dart';
import 'package:test_task/src/domain/entity/product_entity.dart';
import 'package:test_task/src/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:test_task/src/presentation/widget/favorites_card.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<ProductEntity> productList = [];
  @override
  void initState() {
    context.read<FavoriteCubit>().getFavorite();
    context.read<SearchCubit>().cancelSearch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {
          //-- product removed from favorites
          if (state is FavoriteSuccess) {
            context.read<FavoriteCubit>().getFavorite();
          }
        },
        builder: (context, state) {
          print(state);
          if (state is FavoriteLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is FavoriteFailure) {
            return BodyText(
              text: state.error,
              color: AppPallet.failureColor,
            );
          }
          if (state is FavoriteLoaded) {
            return BlocBuilder<SearchCubit, SearchState>(
              builder: (context, searchState) {
                final searchText = (searchState as Searched).searchText;
                if (searchText != '') {
                  productList =
                      filterProductsByText(state.products, searchText);
                } else {
                  productList = state.products;
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: "${productList.length} results found"),
                    Expanded(
                      child: ListView.builder(
                        itemCount: productList.length,
                        itemBuilder: (context, index) {
                          return FavoritesCard(
                            productEntity: productList[index],
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          }
          return Center(
            child: BodyText(
              text: "Something went wrong",
              color: AppPallet.failureColor,
            ),
          );
        },
      ),
    );
  }
}
