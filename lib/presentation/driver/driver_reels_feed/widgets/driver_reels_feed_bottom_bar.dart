import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class DriverReelsFeedBottomBar extends StatelessWidget {
  const DriverReelsFeedBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 94,
      padding: const EdgeInsets.fromLTRB(14, 10, 14, 14),
      decoration: BoxDecoration(
        color: const Color(0xFF0E1730),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _item(
            icon: Icons.movie_filter_outlined,
            label: 'Reels',
            selected: false,
          ),
          _item(icon: Icons.search_rounded, label: 'Feed', selected: true),
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.09),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.add_circle_outline,
              color: ColorConstant.appColor,
            ),
          ),
          _item(
            icon: Icons.message_outlined,
            label: 'Messages',
            selected: false,
            dot: true,
          ),
          _item(
            icon: Icons.person_outline_rounded,
            label: 'Profile',
            selected: false,
          ),
        ],
      ),
    );
  }

  Widget _item({
    required IconData icon,
    required String label,
    required bool selected,
    bool dot = false,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(
              icon,
              color: selected ? ColorConstant.appColor : Colors.white54,
              size: 22,
            ),
            if (dot)
              const Positioned(
                right: -2,
                top: -2,
                child: CircleAvatar(
                  radius: 3,
                  backgroundColor: ColorConstant.appColor,
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: selected ? ColorConstant.appColor : Colors.white54,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
