import 'package:flutter/material.dart';
import 'package:test_task/src/core/common/widget/app_text.dart';
import 'package:test_task/src/core/theme/app_pallet.dart';
import 'package:test_task/src/presentation/widget/rate_widget.dart';

class FavoritesCard extends StatelessWidget {
  const FavoritesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
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
                shape: BoxShape.circle,
                image: DecorationImage(
                  scale: 8,
                  image: AssetImage('assets/svg_icons/test.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelText(
                  text: "iPhone 14",
                ),
                BodyText(
                  text: "\$60",
                  color: AppPallet.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w100,
                ),
                RatingWidget(rate: 3),
              ],
            ),
          ],
        ),
        trailing: Icon(
          Icons.favorite,
          color: AppPallet.red,
        ),
      ),
    );
  }
}
