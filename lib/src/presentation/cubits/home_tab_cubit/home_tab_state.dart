part of 'home_tab_cubit.dart';

@immutable
sealed class HomeTabState {}

final class HomeTab extends HomeTabState {
  final String tab;

  HomeTab({required this.tab});
}
