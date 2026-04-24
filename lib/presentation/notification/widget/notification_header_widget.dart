import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/color_constant/color_constant.dart';
import '../notification_screen.dart';

class NotificationHeader extends StatelessWidget {
  final VoidCallback onBackTap;

  const NotificationHeader({super.key, required this.onBackTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleIconButton(icon: Icons.arrow_back, onTap: onBackTap),
        const SizedBox(width: 10),
        const Expanded(
          child: Center(
            child: Text(
              'Notification',
              style: TextStyle(
                color: ColorConstant.blackColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          '2 NEW',
          style: TextStyle(
            color: ColorConstant.whiteColor,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ).wrapWith(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: ColorConstant.appColor,
            borderRadius: BorderRadius.circular(999),
          ),
        ),
      ],
    );
  }
}

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const CircleIconButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: ColorConstant.lightGreyColor.withValues(alpha: 0.18),
          ),
        ),
        child: Icon(icon, color: ColorConstant.blackColor, size: 22),
      ),
    );
  }
}