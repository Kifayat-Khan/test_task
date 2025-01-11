import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_task/src/core/constants/home_tabs.dart';

part 'home_tab_state.dart';

class HomeTabCubit extends Cubit<HomeTabState> {
  HomeTabCubit() : super(HomeTab(tab: HomeTabs.product));

  void update(String tab) {
    emit(HomeTab(tab: tab));
  }
}
