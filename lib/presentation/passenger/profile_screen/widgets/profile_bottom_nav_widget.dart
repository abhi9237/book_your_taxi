import 'package:flutter/material.dart';

import '../../../../core/color_constant/color_constant.dart';
import '../../../../core/icons/app_icons.dart';

class ProfileBottomNavWidget extends StatelessWidget {
  final int selectedIndex;

  const ProfileBottomNavWidget({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      decoration: BoxDecoration(
        color: ColorConstant.whiteColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorConstant.lightGreyColor.withValues(alpha: 0.2),
            offset: const Offset(0, -2),
            spreadRadius: 4,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _NavItem(
            index: 0,
            selectedIndex: selectedIndex,
            icon: AppIcons.homeUnSelectedIcon,
            title: 'Home',
          ),
          _NavItem(
            index: 1,
            selectedIndex: selectedIndex,
            icon: AppIcons.walletUnselectedIcon,
            title: 'Wallet',
          ),
          _NavItem(
            index: 2,
            selectedIndex: selectedIndex,
            icon: AppIcons.bookingUnselectedIcon,
            title: 'Bookings',
          ),
          _NavItem(
            index: 3,
            selectedIndex: selectedIndex,
            icon: AppIcons.chatUnselectedIcon,
            title: 'Chat',
          ),
          _NavItem(
            index: 4,
            selectedIndex: selectedIndex,
            icon: AppIcons.personSelectedIcon,
            title: 'Profile',
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final String icon;
  final String title;

  const _NavItem({
    required this.index,
    required this.selectedIndex,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final bool selected = index == selectedIndex;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 10,
          width: 20,
          decoration: BoxDecoration(
            color: selected ? ColorConstant.appColor : Colors.transparent,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
        ),
        Image.asset(
          icon,
          height: 22,
          width: 22,
          color: selected ? ColorConstant.appColor : ColorConstant.lightGreyColor,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: selected ? ColorConstant.appColor : ColorConstant.lightGreyColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
