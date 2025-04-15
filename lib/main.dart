import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/src/core/common/search_cubit/search_cubit.dart';
import 'package:test_task/src/core/common/widget/error_widget.dart';
import 'package:test_task/init_dependency.dart';
import 'package:test_task/src/core/theme/app_themes.dart';
import 'package:test_task/src/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:test_task/src/presentation/cubits/fetch_data_cubit/fetch_data_cubit.dart';
import 'package:test_task/src/presentation/cubits/home_tab_cubit/home_tab_cubit.dart';
import 'package:test_task/src/presentation/screens/home_screen.dart';

void main() async {
  await init();
  // Override Flutter's default error widget
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return CustomErrorWidget(details: details);
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<HomeTabCubit>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<FetchDataCubit>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<FavoriteCubit>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<SearchCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Test Task',
        debugShowCheckedModeBanner: false,
        theme: AppThemes.light,
        home: const HomeScreen(),
        //ProductDetailScreen()
        //ProductByCategoryScreen(),
        //const HomeScreen(),
      ),
    );
  }
}
