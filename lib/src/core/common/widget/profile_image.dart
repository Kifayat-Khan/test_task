import 'package:flutter/material.dart';
import 'package:test_task/src/core/theme/app_pallet.dart';

class ProfileImageWidget extends StatelessWidget {
  final double radius;
  final double iconSize;
  final Color bgColor;
  const ProfileImageWidget({
    super.key,
    this.radius = 60,
    this.iconSize = 40,
    this.bgColor = AppPallet.white,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: bgColor,
      child: Icon(
        Icons.person,
        color: AppPallet.primary,
        size: iconSize,
      ),
    );
  }
}
