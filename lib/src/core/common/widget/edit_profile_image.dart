import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_task/src/core/theme/app_pallet.dart';

class EditProfileImageWidget extends StatelessWidget {
  const EditProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CircleAvatar(
              radius: 65,
              backgroundColor: AppPallet.iconWhite,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: AppPallet.white,
                child: Icon(
                  Icons.person,
                  color: AppPallet.gray,
                  size: 40,
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 120,
            child: CircleAvatar(
              radius: 17,
              backgroundColor: AppPallet.iconWhite,
              child: CircleAvatar(
                radius: 16,
                backgroundColor: AppPallet.white,
                child: Icon(
                  CupertinoIcons.camera,
                  color: AppPallet.iconWhite,
                  size: 15,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
