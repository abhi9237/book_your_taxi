import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/color_constant/color_constant.dart';
import '../notification_screen.dart';
import 'notification_tile_widget.dart';

class NotificationSectionView extends StatelessWidget {
  final NotificationSection section;

  const NotificationSectionView({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                section.title,
                style: TextStyle(
                  color: ColorConstant.blackGreyColor.withValues(alpha: 0.72),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                ),
              ),
              Text(
                section.actionText,
                style: const TextStyle(
                  color: ColorConstant.appColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          for (int index = 0; index < section.items.length; index++) ...[
            NotificationTile(item: section.items[index]),
            if (index != section.items.length - 1)
              Divider(
                height: 1,
                thickness: 1,
                color: ColorConstant.lightGreyColor.withValues(alpha: 0.12),
              ),
          ],
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}