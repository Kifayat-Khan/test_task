import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/src/core/common/search_cubit/search_cubit.dart';
import 'package:test_task/src/core/theme/app_pallet.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final textController = TextEditingController();
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        //vertical: 10,
      ),
      child: TextField(
        // textAlign: TextAlign.right,

        controller: textController,
        //focusNode: focusNode,
        //controller: textEditingController,
        onChanged: (text) {
          context.read<SearchCubit>().search(text);
          if (text.isEmpty) {
            context.read<SearchCubit>().cancelSearch();
          }
        },
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppPallet.primary,
            ),
        decoration: InputDecoration(
          border: appInputBorder(),
          contentPadding: EdgeInsets.zero,
          focusedErrorBorder: appInputBorder(),
          focusedBorder: appInputBorder(),
          enabledBorder: appInputBorder(),
          constraints: BoxConstraints(maxHeight: 40),
          hintText: "Search",
          hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppPallet.gray,
              ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: AppPallet.primary,
          ),
          //suffixIcon:
          filled: true,
          fillColor: AppPallet.white,
        ).applyDefaults(
          Theme.of(context).inputDecorationTheme,
        ),
      ),
    );
  }
}

appInputBorder() => OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppPallet.primary,
        width: 1.5,
      ),
      borderRadius: BorderRadius.circular(8),
    );
