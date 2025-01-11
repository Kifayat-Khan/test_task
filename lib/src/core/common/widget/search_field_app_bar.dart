import 'package:flutter/material.dart';
import 'package:test_task/src/core/common/widget/app_text.dart';
import 'package:test_task/src/core/common/widget/search_field.dart';
import 'package:test_task/src/core/extenstions/context_extention.dart';
import 'package:test_task/src/core/theme/app_pallet.dart';

class SearchFieldAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onTapBack;
  final bool isBackVisible;
  const SearchFieldAppBar({
    super.key,
    required this.title,
    this.onTapBack,
    this.isBackVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Visibility(
        visible: isBackVisible,
        child: InkWell(
          onTap: () {
            if (onTapBack != null) {
              onTapBack!();
            }

            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      elevation: 0,
      backgroundColor: AppPallet.white,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 30),
          HeadingText(
            text: title,
            fontSize: context.width(0.05),
          ),
          SizedBox(height: 10), // Spacing between title and search bar
        ],
      ),
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: SearchField(),
      ),
      centerTitle: true,
      toolbarHeight: 120, // Height to accommodate search bar
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120); // Total height of the AppBar
}
