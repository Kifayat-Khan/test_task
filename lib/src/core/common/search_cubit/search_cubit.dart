import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(Searched(searchText: ''));

  void search(String text) {
    emit(Searched(searchText: text));
  }

  void cancelSearch() {
    emit(Searched(searchText: ''));
  }
}
