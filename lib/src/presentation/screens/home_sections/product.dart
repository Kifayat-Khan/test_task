import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/src/core/common/widget/app_text.dart';
import 'package:test_task/src/core/theme/app_pallet.dart';
import 'package:test_task/src/presentation/cubits/fetch_data_cubit/fetch_data_cubit.dart';
import 'package:test_task/src/presentation/widget/product_card.dart';

class Product extends StatefulWidget {
  const Product({super.key, this.categoryUrl});
  final String? categoryUrl;

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  void initState() {
    if (widget.categoryUrl != null) {
      context
          .read<FetchDataCubit>()
          .fetchProductsByCategory(widget.categoryUrl!);
    }
    {
      context.read<FetchDataCubit>().fetchProduct();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: BlocBuilder<FetchDataCubit, FetchDataState>(
        builder: (context, state) {
          if (state is FetchDataLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is FetchDataFailure) {
            return BodyText(
              text: state.error,
              color: AppPallet.failureColor,
            );
          } else if (state is FetchDataAllProducts) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(text: "${state.productList.length} results found"),
                  ListView.builder(
                    shrinkWrap:
                        true, // Prevents ListView from taking infinite height
                    physics:
                        NeverScrollableScrollPhysics(), // Disables ListView's own scrolling
                    itemCount: state.productList.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        productEntity: state.productList[index],
                      );
                    },
                  ),
                  // ...List.generate(
                  //   state.productList.length,
                  //   (index) {
                  //     return ProductCard(
                  //       productEntity: state.productList[index],
                  //     );
                  //   },
                  // ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
