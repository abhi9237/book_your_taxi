import 'package:flutter/material.dart';

import '../../../core/color_constant/color_constant.dart';

class SettingsItemData {
  final IconData icon;
  final String title;

  SettingsItemData({
    required this.icon,
    required this.title,
  });
}

class SettingsItemWidget extends StatelessWidget {
  final SettingsItemData item;

  const SettingsItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 66,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Row(
          children: [
            Icon(item.icon, color: ColorConstant.appColor, size: 26),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                item.title,
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
    );
  }
}
