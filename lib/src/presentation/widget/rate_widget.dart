import 'package:flutter/material.dart';
import 'package:test_task/src/core/common/widget/app_text.dart';
import 'package:test_task/src/core/theme/app_pallet.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
    required this.rate,
  });
  final int rate;

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      AppPallet.gray,
      AppPallet.gray,
      AppPallet.gray,
      AppPallet.gray,
      AppPallet.gray,
    ];
    for (int i = 0; i < rate; i++) {
      colors[i] = AppPallet.rate;
    }
    return Row(
      children: [
        LabelText(
          text: "$rate",
        ),
        SizedBox(width: 8),
        ...List.generate(colors.length, (index) {
          return Icon(Icons.star, size: 16, color: colors[index]);
        }),
      ],
    );
  }
}
