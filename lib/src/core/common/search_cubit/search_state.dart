part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class Searched extends SearchState {
  final String searchText;

  Searched({required this.searchText});
}
