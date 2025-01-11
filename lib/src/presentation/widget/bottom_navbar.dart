import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task/src/core/assets/icons.dart';
import 'package:test_task/src/core/common/widget/app_text.dart';
import 'package:test_task/src/core/constants/home_tabs.dart';
import 'package:test_task/src/core/theme/app_pallet.dart';
import 'package:test_task/src/presentation/cubits/home_tab_cubit/home_tab_cubit.dart';

//
class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5), topRight: Radius.circular(5)),
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(SvgIcons.product, 0, HomeTabs.product),
            _buildNavItem(SvgIcons.category, 1, HomeTabs.category),
            _buildNavItem(SvgIcons.favorites, 2, HomeTabs.favorites),
            _buildNavItem(SvgIcons.profile, 3, HomeTabs.profile),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        context.read<HomeTabCubit>().update(HomeTabs.product);
      }
      if (index == 1) {
        context.read<HomeTabCubit>().update(HomeTabs.category);
      }
      if (index == 2) {
        context.read<HomeTabCubit>().update(HomeTabs.favorites);
      }
      if (index == 3) {
        context.read<HomeTabCubit>().update(HomeTabs.profile);
      }
    });
  }

  _buildNavItem(String icon, int index, String label) {
    Color iconColor = AppPallet.iconWhite;
    if (index == _selectedIndex) {
      iconColor = AppPallet.white;
    }
    return Expanded(
      child: InkWell(
        onTap: () {
          _onItemTapped(index);
        },
        child: Container(
          margin: EdgeInsets.zero,
          alignment: Alignment.center,

          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: _selectedIndex == index
                  ? AppPallet
                      .navbarSelected // Background color for selected icon
                  : AppPallet.primary,
              border: Border.all(width: 0) // No background for unselected icons
              // Circular background
              ),
          child: Column(
            children: [
              SvgPicture.asset(
                icon,
                colorFilter: ColorFilter.mode(
                  iconColor,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              BodyText(
                text: label,
                color: AppPallet.iconWhite,
              )
            ],
          ),
          // The icon itself
        ),
      ),
    );
  }
}
