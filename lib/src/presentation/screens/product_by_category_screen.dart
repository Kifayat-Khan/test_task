import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/src/core/common/widget/search_field_app_bar.dart';
import 'package:test_task/src/presentation/cubits/fetch_data_cubit/fetch_data_cubit.dart';
import 'package:test_task/src/presentation/screens/home_sections/product.dart';

class ProductByCategoryScreen extends StatelessWidget {
  const ProductByCategoryScreen(
      {super.key, required this.category, required this.categoryUrl});
  final String categoryUrl;
  final String category;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPOp, v) {
        context.read<FetchDataCubit>().fetchCategory();
      },
      child: Scaffold(
        appBar: SearchFieldAppBar(
          title: category,
          onTapBack: () {
            context.read<FetchDataCubit>().fetchCategory();
          },
        ),
        body: Product(
          categoryUrl: categoryUrl,
        ),
      ),
    );
  }
}
