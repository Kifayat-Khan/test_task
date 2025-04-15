import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/src/presentation/widget/bottom_navbar.dart';
import 'package:test_task/src/core/common/widget/search_field_app_bar.dart';
import 'package:test_task/src/core/constants/home_tabs.dart';
import 'package:test_task/src/presentation/cubits/home_tab_cubit/home_tab_cubit.dart';
import 'package:test_task/src/presentation/screens/home_sections/category.dart';
import 'package:test_task/src/presentation/screens/home_sections/favorites.dart';
import 'package:test_task/src/presentation/screens/home_sections/product.dart';
import 'package:test_task/src/presentation/screens/home_sections/profile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabCubit, HomeTabState>(
      builder: (context, state) {
        final tab = (state as HomeTab).tab;
        return Scaffold(
          appBar: SearchFieldAppBar(
            title: tab,
            isSearchEnable: tab != HomeTabs.profile,
            isBackVisible: false,
          ),
          body: tab == HomeTabs.category
              ? Category()
              : tab == HomeTabs.favorites
                  ? Favorites()
                  : tab == HomeTabs.profile
                      ? Profile()
                      : Product(),
          bottomNavigationBar: BottomNavbar(),
        );
      },
    );
  }
}
