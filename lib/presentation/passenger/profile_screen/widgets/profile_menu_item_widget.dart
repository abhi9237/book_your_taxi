import 'package:flutter/material.dart';

import '../../../../core/color_constant/color_constant.dart';

class ProfileMenuItemWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool showDivider;
  final VoidCallback? onTap;

  const ProfileMenuItemWidget({
    super.key,
    required this.icon,
    required this.title,
    this.showDivider = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 60,
            child: Row(
              children: [
                Icon(icon, color: ColorConstant.appColor, size: 28),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: ColorConstant.blackColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: ColorConstant.appColor,
                  size: 28,
                ),
              ],
            ),
          ),
        ),
        if (showDivider)
          Divider(
            height: 1,
            thickness: 1,
            color: ColorConstant.lightGreyColor.withValues(alpha: 0.12),
          ),
      ],
    );
  }
}
