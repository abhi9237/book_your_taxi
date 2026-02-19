import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import '../../../controller/bottom_nav_controller.dart';
import '../../../core/icons/app_icons.dart';

class BottomNavTab extends StatelessWidget {
  final BottomNavController controller;
  const BottomNavTab({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      decoration: BoxDecoration(
        color: ColorConstant.whiteColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
          topRight: Radius.circular(20),),
        boxShadow: [
          BoxShadow(
            color: ColorConstant.lightGreyColor.withValues(alpha: 0.2),
            offset: Offset(0, -2),
            spreadRadius: 4,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomNavTabButton(
            index: 0,
            selectedIndex: controller.selectedIndex.value,
            icon: controller.selectedIndex.value == 0
                ? AppIcons.homeSelectedIcon
                : AppIcons.homeUnSelectedIcon,
            onTap: () {
              controller.onTapSelectedIndex(0);
            },
            title: 'Home',
          ),
          BottomNavTabButton(
            index: 1,
            selectedIndex: controller.selectedIndex.value,
            icon: controller.selectedIndex.value == 1
                ? AppIcons.walletSelectedIcon
                : AppIcons.walletUnselectedIcon,
            onTap: () {
              controller.onTapSelectedIndex(1);
            },
            title: 'Wallet',
          ),
          BottomNavTabButton(
            selectedIndex: controller.selectedIndex.value,
            index: 2,
            icon: controller.selectedIndex.value == 2
                ? AppIcons.bookingSelectedIcon
                : AppIcons.bookingUnselectedIcon,
            onTap: () {
              controller.onTapSelectedIndex(2);
            },
            title: 'Booking',
          ),
          BottomNavTabButton(
            selectedIndex: controller.selectedIndex.value,
            index: 3,
            icon: controller.selectedIndex.value == 3
                ? AppIcons.chatSelectedIcon
                : AppIcons.chatUnselectedIcon,
            onTap: () {
              controller.onTapSelectedIndex(3);
            },
            title: 'Chat',
          ),
          BottomNavTabButton(
            selectedIndex: controller.selectedIndex.value,
            index: 4,
            icon: controller.selectedIndex.value == 4
                ? AppIcons.personSelectedIcon
                : AppIcons.personUnselectedIcon,
            onTap: () {
              controller.onTapSelectedIndex(4);
            },
            title: 'Profile',
          ),
        ],
      ),
    );
  }
}

class BottomNavTabButton extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final VoidCallback onTap;
  final String icon;
  final String title;

  const BottomNavTabButton({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 10,
            width: 20,
            decoration: BoxDecoration(
              color: index == selectedIndex
                  ? ColorConstant.appColor
                  : Colors.transparent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),
          Image.asset(
            icon,
            height: 22,
            width: 22,
            color: index == selectedIndex
                ? ColorConstant.appColor
                : ColorConstant.lightGreyColor,
          ),

          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: index == selectedIndex
                  ? ColorConstant.appColor
                  : ColorConstant.lightGreyColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
