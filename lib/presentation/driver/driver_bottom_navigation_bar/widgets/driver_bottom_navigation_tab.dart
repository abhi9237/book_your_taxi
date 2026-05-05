import 'package:book_your_taxi/controller/driver_bottom_navigation_bar_controller.dart';
import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class DriverBottomNavigationTab extends StatelessWidget {
  final DriverBottomNavigationBarController controller;

  const DriverBottomNavigationTab({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86,
      padding: const EdgeInsets.fromLTRB(14, 10, 14, 14),
      decoration: BoxDecoration(
        color: const Color(0xFF0F1116),
        border: Border(
          top: BorderSide(color: Colors.white.withValues(alpha: 0.07)),
        ),
      ),
      child: Row(
        children: [
          _NavTab(
            icon: Icons.home_filled,
            title: 'Home',
            selected: controller.selectedIndex.value == 0,
            onTap: () => controller.onTapSelectedIndex(0),
          ),
          _NavTab(
            icon: Icons.bar_chart_rounded,
            title: 'Stats',
            selected: controller.selectedIndex.value == 1,
            onTap: () => controller.onTapSelectedIndex(1),
          ),
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(999),
              onTap: () => controller.onTapSelectedIndex(2),
              child: Center(
                child: Container(
                  height: 44,
                  width: 44,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFF7A00),
                  ),
                  child: const Icon(Icons.add, color: Colors.black, size: 24),
                ),
              ),
            ),
          ),
          _NavTab(
            icon: Icons.chat_bubble_outline_rounded,
            title: 'Messages',
            selected: controller.selectedIndex.value == 3,
            onTap: () => controller.onTapSelectedIndex(3),
          ),
          _NavTab(
            icon: Icons.person_outline_rounded,
            title: 'Profile',
            selected: controller.selectedIndex.value == 4,
            onTap: () => controller.onTapSelectedIndex(4),
          ),
        ],
      ),
    );
  }
}

class _NavTab extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _NavTab({
    required this.icon,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: selected ? ColorConstant.appColor : Colors.white54,
              size: 19,
            ),
            const SizedBox(height: 3),
            Text(
              title,
              style: TextStyle(
                color: selected ? ColorConstant.appColor : Colors.white54,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
