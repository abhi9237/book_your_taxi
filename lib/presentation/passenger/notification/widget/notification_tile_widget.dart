import 'package:flutter/cupertino.dart';

import '../../../../core/color_constant/color_constant.dart';
import '../notification_screen.dart';

class NotificationTile extends StatelessWidget {
  final NotificationItemData item;

  const NotificationTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 54,
            width: 54,
            decoration: BoxDecoration(
              color: ColorConstant.blackGreyColor.withValues(alpha: 0.08),
              shape: BoxShape.circle,
            ),
            child: Icon(
              item.icon,
              color: ColorConstant.appColor,
              size: 26,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        item.title,
                        style: const TextStyle(
                          color: ColorConstant.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      item.time,
                      style: TextStyle(
                        color: ColorConstant.blackGreyColor.withValues(alpha: 0.7),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  item.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: ColorConstant.blackGreyColor.withValues(alpha: 0.68),
                    fontSize: 12.5,
                    fontWeight: FontWeight.w400,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}