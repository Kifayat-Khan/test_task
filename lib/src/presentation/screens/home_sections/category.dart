import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/src/core/common/search_cubit/search_cubit.dart';
import 'package:test_task/src/core/common/widget/app_text.dart';
import 'package:test_task/src/core/theme/app_pallet.dart';
import 'package:test_task/src/core/use_case/filter_category.dart';
import 'package:test_task/src/domain/entity/category_entity.dart';
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
    context.read<SearchCubit>().cancelSearch();
    super.initState();
  }

  List<CategoryEntity> categoryList = [];
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
            categoryList = state.categoryList;
            return BlocBuilder<SearchCubit, SearchState>(
              builder: (context, searchState) {
                //--apply filter
                final searchText = (searchState as Searched).searchText;
                if (searchText != '') {
                  categoryList =
                      filterCategoriesByText(state.categoryList, searchText);
                } else {
                  categoryList = state.categoryList;
                }
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(text: "${categoryList.length} results found"),
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
                        itemCount: categoryList.length,
                        itemBuilder: (context, index) {
                          return CategoryCard(
                            categoryEntity: categoryList[index],
                          );
                        },
                      )
                    ],
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
