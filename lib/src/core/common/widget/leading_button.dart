import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_task/src/core/theme/app_pallet.dart';

class LeadingButton extends StatelessWidget {
  const LeadingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.centerEnd,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const CircleAvatar(
          backgroundColor: AppPallet.white,
          child: Icon(
            CupertinoIcons.back,
            color: AppPallet.primary,
          ),
        ),
      ),
    );
  }
}
