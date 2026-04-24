import 'package:flutter/material.dart';

import '../../../core/color_constant/color_constant.dart';

class ManageAddressItemData {
  final String title;
  final String subtitle;

  ManageAddressItemData({
    required this.title,
    required this.subtitle,
  });
}

class ManageAddressItemWidget extends StatelessWidget {
  final ManageAddressItemData item;

  const ManageAddressItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: ColorConstant.blackGreyColor.withValues(alpha: 0.85),
                width: 1.4,
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.place,
                color: ColorConstant.appColor,
                size: 12,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    color: ColorConstant.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  item.subtitle,
                  style: TextStyle(
                    color: ColorConstant.blackGreyColor.withValues(alpha: 0.7),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    height: 1.2,
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
