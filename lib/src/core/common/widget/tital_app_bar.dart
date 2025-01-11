import 'package:flutter/material.dart';
import 'package:test_task/src/core/common/widget/app_text.dart';
import 'package:test_task/src/core/extenstions/context_extention.dart';
import 'package:test_task/src/core/theme/app_pallet.dart';

class TitleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const TitleAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios_new),
      ),
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

      centerTitle: true,
      toolbarHeight: 60, // Height to accommodate search bar
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60); // Total height of the AppBar
}
