import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_task/src/core/common/widget/app_text.dart';
import 'package:test_task/src/core/extenstions/context_extention.dart';
import 'package:test_task/src/core/theme/app_pallet.dart';
import 'package:test_task/src/presentation/widget/user_card.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserCard(),
            SizedBox(
              height: context.height(0.05),
            ),
            _BodyWidget(
              icon: Icons.settings_outlined,
              label: "Kontoinstallningar",
            ),
            _BodyWidget(
              icon: CupertinoIcons.camera_on_rectangle_fill,
              label: "Mina betalmetoder",
            ),
            _BodyWidget(
              icon: Icons.sports_soccer,
              label: "Mina betalmetoder",
            )
          ],
        ),
      ),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  const _BodyWidget({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppPallet.primary,
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: BodyText(
          text: label,
        ),
      ),
    );
  }
}
