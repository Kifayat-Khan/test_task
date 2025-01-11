import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/src/core/common/widget/app_text.dart';
import 'package:test_task/src/core/theme/app_pallet.dart';
import 'package:test_task/src/presentation/cubits/fetch_data_cubit/fetch_data_cubit.dart';
import 'package:test_task/src/presentation/widget/category_card.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  void initState() {
    context.read<FetchDataCubit>().fetchCategory();
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
          }
          if (state is FetchDataCategories) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(text: "${state.categoryList.length} results found"),
                  const SizedBox(
                    height: 10,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 25,
                      mainAxisSpacing: 20,
                      crossAxisCount: 2,
                    ),
                    itemCount: state.categoryList.length,
                    itemBuilder: (context, index) {
                      return CategoryCard(
                        categoryEntity: state.categoryList[index],
                      );
                    },
                  )
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
