import 'package:flutter/material.dart';
import 'package:test_task/src/core/common/widget/app_text.dart';
import 'package:test_task/src/core/theme/app_pallet.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 0,
      ),
      decoration: BoxDecoration(
        color: AppPallet.primary,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: ListTile(
        minLeadingWidth: 0,
        title: Row(
          children: [
            //--image
            Container(
              width: 80,
              height: 80,
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppPallet.iconWhite),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelText(
                  text: "Kifayat Khan",
                  color: AppPallet.white,
                ),
                const SizedBox(
                  height: 5,
                ),
                BodyText(
                  text: "kkifayat179@gmail.com",
                  color: AppPallet.iconWhite,
                  fontSize: 12,
                  fontWeight: FontWeight.w100,
                ),
                const SizedBox(
                  height: 5,
                ),
                BodyText(
                  text: "03350947928",
                  color: AppPallet.iconWhite,
                  fontSize: 12,
                  fontWeight: FontWeight.w100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
